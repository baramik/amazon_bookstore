# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'
FactoryGirl.define do
  factory :book do
    title "BookTitle"
    description "BookDescription"
    price 10.00
    books_in_stock 500
  end
end
