And(/^I navigate to Login page$/) do
  click_link 'Log in'
  expect(page).to have_css(".page-title h1", text: "Welcome, Please Sign In!")
end

Then(/^I should see error message$/) do |table|
  table.raw.flatten.each do |error_message|
    expect(page).to have_content error_message
  end
end

When(/^I fill in login form with "([^"]*)", "([^"]*)"$/) do |email, password|
  @login_page.fill_login_form(email, password)
end

Then(/^I should see "([^"]*)" link$/) do |link_text|
  expect(page).to have_link(link_text)
end