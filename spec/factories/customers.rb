# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'
FactoryGirl.define do
  factory :customer do
    email Faker::Internet.email(name = 'baramik@ya.ru')
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
  end
end
