FactoryGirl.define do
  factory :review do
    rating "5"
    body "wunderbar"
    user
    donut
  end
end
