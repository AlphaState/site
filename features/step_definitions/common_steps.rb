Given /am a (\w+)/ do |role|
  case role
  when 'user'
  when 'visitor'
  else
    raise "Cannot recognize the role '#{ role }'."
  end
end

Given /^there (?:is|are) ([\d\w]+) (\w+)/ do |count, object|
  name = object.singularize
  klass = name.capitalize.constantize

  case count
  when 'one'
    count = 1
  else
    count = count.to_i
  end

  count.times { create name }
end

Given /am on (.*)/ do |address|
  visit path_to(address)
end

When /go to (.*)/ do |address|
  visit path_to(address)
end

When /enter "(.*)" in "(.*)"/ do |text, field|
  fill_in field, with: text
end

When /press "(.*)"/ do |button|
  click_button button
end

Then /should be on (.*)/ do |address|
  expect(current_path).to eq(path_to(address))
end

Then /should see "(.*)"/ do |text|
  expect(page).to have_content(text)
end

Then /there should be ([\d\w]+) (.*)/ do |count, object|
  klass = object.singularize.capitalize.constantize

  case count
  when 'no'
    count = 0
  else
    count = count.to_i
  end

  expect(klass.count).to eq(count)
end

Then 'WTF?' do
  save_and_open_page
end
