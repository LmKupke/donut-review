FactoryGirl.define do
  factory :donut do
    name "Glazed"
    description "A delicious donut"
    image { File.open(File.join("#{Rails.root}/spec/support/images/photo.png")) }
    user
    vendor
  end
end
