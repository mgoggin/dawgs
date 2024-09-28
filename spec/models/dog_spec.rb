require "rails_helper"

RSpec.describe Dog do
  subject(:dog) { create(:dog) }

  # Associations
  it { is_expected.to belong_to :user }

  # Validations
  it { is_expected.to validate_presence_of :name }
end
