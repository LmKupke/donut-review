FactoryGirl.define do
  factory :donut do
    name "Glazed"
    description "A delicious donut"
    image do 
      File.open(File.join("#{Rails.root}/spec/support/images/photo.png"))
    end
    user
    vendor
  end
end
