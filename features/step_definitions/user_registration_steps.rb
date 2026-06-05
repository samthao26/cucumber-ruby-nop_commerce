Given(/^I open demo nonCommerce homepage$/) do
  visit'/'
end

And(/^I navigate to Register page$/) do
  click_link 'Register'
  expect(page). to have_css(".page-title h1", text: "Register")
end


Then(/^I should see error messages$/) do |table|
  table.raw.flatten.each do |error_msg|
    expect(page).to have_content(error_msg)
  end
end

When(/^I fill in register form with "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)"$/) do |firstname ,lastname, email , company ,password ,confirm_password |
  email = Faker::Internet.unique.email if email == 'RANDOM'
  @register_page.fill_register_form(firstname, lastname, email,company, password, confirm_password)
end


Then(/^I should see error message "([^"]*)"$/) do |error_message|
  expect(page).to have_content(error_message)
end

Then(/^I should see success message "([^"]*)"$/) do |message|
  expect(page).to have_content(message)
end


Then(/^I click on "([^"]*)" button$/) do |button_name|
  click_button button_name
end