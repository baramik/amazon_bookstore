# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'
FactoryGirl.define do
  factory :credit_card do
    number Faker::Number.number(16)
    CVV Faker::Number.number(3)
    expiration_month 12
    expiration_year 17
  end
end
