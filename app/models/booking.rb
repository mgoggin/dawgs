# == Schema Information
#
# Table name: bookings
#
#  id         :bigint           not null, primary key
#  period     :string
#  pick_up_on :date
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  dog_id     :bigint           not null
#  walker_id  :bigint           not null
#
# Indexes
#
#  index_bookings_on_dog_id     (dog_id)
#  index_bookings_on_walker_id  (walker_id)
#
# Foreign Keys
#
#  fk_rails_...  (dog_id => dogs.id)
#  fk_rails_...  (walker_id => users.id)
#
class Booking < ApplicationRecord
  enum :period, %i[morning afternoon both].index_by(&:itself), validate: true
  enum :status, %i[home in_transit at_field returning dropped_off].index_by(&:itself), validate: true

  belongs_to :dog, optional: false
  belongs_to :walker, class_name: "User", optional: true

  validates :pick_up_on, comparison: {greater_than_or_equal_to: -> { Time.zone.today }}
end
