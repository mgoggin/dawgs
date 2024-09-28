FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password(min_length: 12) }
    password_confirmation { password }
    verified { true }
    role { "user" }

    trait :walker do
      role { "walker" }
    end

    trait :manager do
      role { "manager" }
    end
  end
end
