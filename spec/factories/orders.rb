# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    total_price 40.00
    completed_date Date.today
    state 'inprogress'
  end
end
