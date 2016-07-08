FactoryGirl.define do
  sequence(:street_number) { |n| n }
  factory :vendor do
    name "Donna's Donuts"
    street_number
    street_name "Comm Ave"
    city "Boston"
    state "MA"
    zipcode "11111"
  end
end
