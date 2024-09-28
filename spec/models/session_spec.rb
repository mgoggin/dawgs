require "rails_helper"

RSpec.describe Session do
  subject(:session) { create(:session) }

  # Associations
  it { is_expected.to belong_to :user }

  # Callbacks
  describe "before_create" do
    let(:ip_address) { Faker::Internet.unique.ip_v4_address }
    let(:user_agent) { Faker::Internet.user_agent }

    before do
      Current.ip_address = ip_address
      Current.user_agent = user_agent
    end

    it "is expected to set the ip_address to the current ip_address" do
      expect(session).to have_attributes(ip_address:)
    end

    it "is expected to set the user_agent to the current user_agent" do
      expect(session).to have_attributes(user_agent:)
    end
  end
end
