FactoryGirl.define do
  factory :review do
    user
    donut
    rating 5
    body "tasty, tasty donut"
  end
end
