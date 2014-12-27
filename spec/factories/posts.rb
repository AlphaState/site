FactoryGirl.define do
  sequence :post_address do |n|
    "post_#{n}"
  end

  factory :post do
    title 'Birds and bees'
    author 'Ivan'
    description 'About birds and bees'
    address { generate(:post_address) }
    content 'Once upon a time…'
  end
end
