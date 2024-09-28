require "rails_helper"

RSpec.describe Booking do
  subject(:booking) { create(:booking) }

  specify do
    expect(booking)
      .to define_enum_for(:period)
      .backed_by_column_of_type(:string)
      .with_values(%i[morning afternoon both].index_by(&:itself))
      .validating(true)
  end

  specify do
    expect(booking)
      .to define_enum_for(:status)
      .backed_by_column_of_type(:string)
      .with_values(%i[home in_transit at_field returning dropped_off].index_by(&:itself))
      .validating(true)
  end

  # Associations
  it { is_expected.to belong_to(:dog).optional(false) }
  it { is_expected.to belong_to(:walker).optional(true).class_name("User") }

  # Validations
  it { is_expected.to validate_comparison_of(:pick_up_on).is_greater_than_or_equal_to(->(_) { Time.zone.today }) }
end
