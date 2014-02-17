# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'
FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@baramik.com"
  end

  factory :customer do
    email { FactoryGirl.generate(:email) }
    password "123123123"
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name

    factory :admin_customer do
      admin true
    end
  end
end
