Given /am a (\w+)/ do |role|
  case role
  when 'user'
    user = create :user
    visit signin_path locale: I18n.locale
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    expect(page).to have_content('Sign out')
  when 'visitor'
  else
    raise "Cannot recognize the role '#{role}'."
  end
end

Given /^there (?:is|are) ([\d\w]+) (\w+)$/ do |count, name|
  case count
  when 'one'
    count = 1
  else
    count = count.to_i
  end

  factory = to_factory name
  count.times { create factory }
end

Given /^there is an? (\w+) with the following:$/ do |name, table|
  factory = to_factory name
  attributes = table_to_hash table
  create factory, attributes
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

When /enter the following:/ do |table|
  table_to_hash(table).each_pair do |field, value|
    fill_in field, with: value
  end
end

When /press "(.*)"/ do |button|
  click_button button
end

When /click "(.*)"/ do |link|
  click_link link
end

Then /should be on (.*)/ do |address|
  expect(current_path).to eq(path_to(address))
end

Then /should (not )?see "(.*)"/ do |invert, text|
  unless invert
    expect(page).to have_content(text)
  else
    expect(page).not_to have_content(text)
  end
end

Then /there should be ([\d\w]+) (.*)/ do |count, name|
  case count
  when 'no'
    count = 0
  else
    count = count.to_i
  end

  model = to_model name
  expect(model.count).to eq(count)
end

Then 'WTF?' do
  save_and_open_page
end
