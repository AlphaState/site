FactoryGirl.define do
  sequence :address do |n|
    "address#{ n }"
  end

  factory :post do
    title 'Birds and bees'
    author 'Ivan'
    description 'About birds and bees'
    date '2014-05-05'
    content 'Once upon a time…'
    address { generate(:address) }
    locale 'en'
  end
end
