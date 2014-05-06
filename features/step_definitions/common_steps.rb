Given /^I have ([\d\w]+) (\w+)/ do |count, object|
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

Given /^I am on (.*)/ do |address|
  visit path_to(address)
end

When /^I press "(.*)"/ do |button|
  click_button button
end

Then /^I should be on (.*)/ do |address|
  expect(current_path).to eq(path_to(address))
end

Then /^I should (?:have|see) ([\d\w]+) (.*)/ do |count, object|
  klass = object.singularize.capitalize.constantize

  case count
  when 'no'
    count = 0
  else
    count = count.to_i
  end

  expect(klass.count).to eq(count)
end
