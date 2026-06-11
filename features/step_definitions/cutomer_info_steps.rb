And(/^I click on "([^"]*)" link$/) do |link_name|
  if page.has_css?('.bar-notification', wait: 2)
    find('.bar-notification .close').click rescue nil
    sleep 0.5
  end

  case link_name
  when 'Log out'
    find('.ico-logout').click
  when 'My account'
    find('.ico-account').click
  else
    click_link link_name
  end
  end

Then(/^I should be redirected to Customer Info page$/) do
  expect(page).to have_content("My account - Customer info")
end

When(/^I select gender as "([^"]*)"$/) do |gender_value|
  @customer_info_page.select_gender(gender_value)
end

And(/^I enter First Name "([^"]*)", Last Name "([^"]*)" and company "([^"]*)"$/) do |firstname, lastname, company|
  @customer_info_page.change_form(firstname, lastname, company)
end
Then(/^I should see field updated correctly with "([^"]*)","([^"]*)", Last Name "([^"]*)" and company "([^"]*)"$/) do |gender_value, firstname, lastname, company|
    expect(page).to have_checked_field(gender_value)
    expect(page).to have_field('FirstName', with: firstname)
    expect(page).to have_field('LastName', with: lastname)
    expect(page).to have_field('Company', with: company)
end


