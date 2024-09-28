FactoryBot.define do
  factory :dog do
    user
    name { Faker::Creature::Dog.unique.name }
  end
end
