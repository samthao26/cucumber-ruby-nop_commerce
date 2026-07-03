And(/^I click Add to cart button$/) do
  @add_to_cart_page.add_item_to_cart_page
end
Then(/^I should see correct total price for "([^"]*)"$/) do |product_name|
  @add_to_cart_page.verify_total_price(product_name)
end

And(/^I click remove button of "([^"]*)" from shopping cart$/) do |product_name|
  @add_to_cart_page.remove_item_from_cart_page(product_name)
end

Then(/^I should see "([^"]*)" removed from shopping cart page$/) do |product_name|
  @add_to_cart_page.verify_item_moved_out_shopping_cart_page(product_name)
end


Then(/^I should see a successfully add_to_cart message "([^"]*)"$/) do |message|
  expect(page).to have_content(message)
end

Then(/^I click to (.*) button of "([^"]*)",$/) do |product_name, direction|
  @add_to_cart_page.click_quantity(product_name, direction)
end