FactoryGirl.define do
  sequence :post_address do |n|
    "post_#{ n }"
  end

  factory :post do
    title 'Birds and bees'
    author 'Ivan'
    description 'About birds and bees'
    address { generate :post_address }
    content 'Once upon a time…'
  end

  sequence :project_address do |n|
    "project_#{ n }"
  end

  sequence :project_priority do |n|
    n
  end

  factory :project do
    title 'Rocket to the Moon'
    motto 'Beautiful things work beautifully'
    thumbnail '/favicon.png'
    address { generate :project_address }
    priority { generate :project_priority }
    content 'Let’s rock!'
  end
end
