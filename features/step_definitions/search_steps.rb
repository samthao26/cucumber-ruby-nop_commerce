Given(/^I fill in search box with "([^"]*)"$/) do |keyword|
  @search_page.fill_in_search_box(keyword)
end

And(/^I click on Search button$/) do
  @search_page.submit_search
rescue Selenium::WebDriver::Error::UnexpectedAlertOpenError
  page.driver.browser.switch_to.alert.accept
end

Then(/^I should see search_result$/) do |table|
  table.raw.flatten.each do |search_result|
    @search_page.verify_search_results(search_result)
  end
end

Given(/^I fill in search form with$/) do |table|
  data = table.rows_hash
  @search_page.fill_search_form(data)
end
Then(/^I should see these product listed$/) do |table|
  product = table.raw.flatten
  product.each do |product_name|
    expect(page).to have_content(product_name)
  end
end

Then(/^I should see"([^"]*)"$/) do |s_error_message|
  @search_page.error_message(s_error_message)
end