# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    total_price 40.00
    completed_date DateTime.now
    state 'in_progress'
  end
end
