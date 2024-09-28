FactoryBot.define do
  factory :booking do
    dog
    walker factory: :user

    pick_up_on do
      Faker::Date.on_day_of_week_between(
        day: %i[monday tuesday wednesday thursday friday],
        from: Time.zone.tomorrow,
        to: 2.years.from_now
      )
    end

    period { :morning }
    status { :home }
  end
end
