And(/^I search for product "([^"]*)"$/) do |product_name|
@search_page.fill_in_search_box(product_name)
  @search_page.submit_search

end

And(/^I navigate to the product review section$/) do
  @product_review_page.access_product_details_page
  expect(page).to have_content 'Write your own review'
end

Then(/^I should see PR_error_messages:$/) do |table|
  table.raw.flatten.each do |pr_error_messages|
    expect(page).to have_content pr_error_messages
  end
end

When(/^I fill in reviews form with:$/) do |table|
  data = table.rows_hash
  @product_review_page.fill_in_review(data)

end


And(/^I should see my new review displays in the Existing Reviews section:$/) do |table|
  data = table.rows_hash
  @product_review_page.verify_existing_review(data)
end

And(/^I click on Product reviews on sidebar$/) do
  @product_review_page.access_review_page
  expect(page).to have_content 'My account - My product reviews'
end

Then(/^I should see my submitted review listed in My product reviews$/) do |table|
  data = table.rows_hash
  @product_review_page.verify_product_review(data)
end

When(/^I click Submit review button$/) do
  @product_review_page.submit_review
end

And(/^I select rating "([^"]*)"$/) do |rating_option|
@product_review_page.select_rate(rating_option)
end
