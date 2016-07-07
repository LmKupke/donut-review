FactoryGirl.define do
  sequence(:email) { |n| "bg#{n}@pipedpiper.net" }
  factory :user do
    first_name "Bertram"
    last_name "Guilfoyle"
    email
    profile_picture "photo.png"
    role "member"
    password "SatanCanada"
    password_confirmation "SatanCanada"
  end
end
