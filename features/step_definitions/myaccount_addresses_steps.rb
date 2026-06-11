Then(/^I should see addresses form$/) do

  expect(page).to have_field('Address_FirstName')
end

When(/^I fill in address form with:$/) do |table|
  data = table.rows_hash
  @myaccount_addresses_page.fill_in_address(data)

end

When(/^i fill in address form with:$/) do |table|
  data = table.rows_hash
  @myaccount_addresses_page.fill_in_address(data)
end

Then(/^I should see addresses saved correctly:$/) do |table|
  data = table.rows_hash
  @myaccount_addresses_page.verify_address(data)
end

And(/^I click on Add new addresses button$/) do
  @myaccount_addresses_page.click_add_new_button
end

And(/^I access Addresses tab from Sidebar menu$/) do
  @myaccount_addresses_page.access_address_link
end