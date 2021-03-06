# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'
FactoryGirl.define do
  factory :author do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    biography Faker::Lorem.characters(3)
  end
end
