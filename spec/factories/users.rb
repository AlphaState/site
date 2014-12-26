FactoryGirl.define do
  sequence :user_email do |n|
    "user_#{n}@home.com"
  end

  factory :user do
    name 'Ivan'
    email { generate :user_email }
    password 'secret'
    password_confirmation { password }
  end
end
