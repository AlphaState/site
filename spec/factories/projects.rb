FactoryGirl.define do
  sequence :project_address do |n|
    "project_#{ n }"
  end

  sequence :project_priority do |n|
    n
  end

  factory :project do
    title 'Rocket to the Moon'
    motto 'Beautiful things work beautifully'
    thumbnail '/project.png'
    address { generate :project_address }
    priority { generate :project_priority }
    content 'Let’s rock!'
  end
end
