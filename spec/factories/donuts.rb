FactoryGirl.define do
  factory :donut do
    name "Glazed"
    description "A delicious donut"
    image "http://upload.wikimedia.org/wikipedia/commons/a/a5/Glazed-Donut.jpg"
    user
    vendor
  end
end
