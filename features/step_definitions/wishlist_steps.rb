
And(/^I click Add to wishlist button$/) do
  @wishlist_page.add_to_wishlist
end

Then(/^I should see "([^"]*)" in wishlist page$/) do |product_name|
  @wishlist_page.verify_product_in_wishlist(product_name)
end

And(/^I navigate to wishlist page$/) do
  @wishlist_page.navigate_to_wishlist_page
end

And(/^I select checkbox of "([^"]*)"$/) do |product_name|
  @wishlist_page.select_product_checkbox(product_name)
end

Then(/^I should see "([^"]*)" removed from wishlist page$/) do |product_name|
  @wishlist_page.verify_product_not_in_wishlist(product_name)

end

Then(/^I should see "([^"]*)" in shopping cart page$/) do |product_name|
  @wishlist_page.verify_product_in_cart(product_name)
end

And(/^I click remove button of "([^"]*)"$/) do |product_name|
  @wishlist_page.remove_from_wishlist(product_name)
end
Then(/^I should see a successfully message "([^"]*)"$/) do |successfully_message|
  expect(page).to have_content(successfully_message)

end

When(/^I navigate to shopping cart page$/) do
  @wishlist_page.navigate_to_cart_page
end

And(/^At wishlist page I click Add to cart button$/) do
  @wishlist_page.add_to_cart_button
end