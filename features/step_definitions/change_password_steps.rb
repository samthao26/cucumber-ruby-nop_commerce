And(/^I access Change Password tab from sidebar menu$/) do
  @change_password_page.access_pw_link
  expect(page).to have_field('OldPassword')
end

Then(/^I should see pw_error_message:$/) do |table|
  table.raw.flatten.each do |pw_error_message|
    expect(page).to have_content(pw_error_message)
  end
  pending
end

Then(/^I should see "([^"]*)"$/) do |pw_error_message|
  expect(page).to have_content(pw_error_message)
end

When(/^I fill in Change Password form with:$/) do |table|
  table.raw.each do |pw|

  end
end

When(/^I fill in Change password with "([^"]*)","([^"]*)","([^"]*)"$/) do |old_password, new_password, confirm_password|
  @change_password_page.fill_change_pw_form(old_password, new_password, confirm_password)
end