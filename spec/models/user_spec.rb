require "rails_helper"

RSpec.describe User do
  subject(:user) { create(:user) }

  it { is_expected.to have_secure_password }
  it { is_expected.to normalize(:email).from("ABC@EXAMPLE.COM").to("abc@example.com") }

  specify do
    expect(user)
      .to define_enum_for(:role)
      .backed_by_column_of_type(:string)
      .with_values(%i[user walker manager].index_by(&:itself))
  end

  # Associations
  it { is_expected.to have_many(:dogs) }
  it { is_expected.to have_many(:sessions) }

  # Validations
  it { is_expected.to validate_presence_of :first_name }
  it { is_expected.to validate_presence_of :last_name }
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
  it { is_expected.to validate_length_of(:password).is_at_least(12) }

  # Callbacks
  describe "before_validation" do
    context "when email has changed" do
      before do
        user.email = Faker::Internet.unique.email
        user.validate
      end

      it "is expected to set verified = false" do
        expect(user).not_to be_verified
      end
    end
  end

  describe "after_update" do
    context "when password has changed" do
      let(:sessions) { create_list(:session, 3, user:) }
      let(:current_session) { sessions.sample }

      before do
        Current.session = current_session

        password = Faker::Internet.unique.password(min_length: 12)

        user.update(password:, password_confirmation: password)
      end

      it "is expected to destroy all sessions except the current session" do
        expect(user.sessions).to contain_exactly(current_session)
      end
    end
  end
end
