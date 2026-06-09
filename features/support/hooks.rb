Before do
  @register_page = RegisterPage.new
  @login_page = LoginPage.new
  @customer_info_page = CustomerInfoPage.new
  @myaccount_addresses_page = MyAccountAddressPage.new
end
After('@add_address') do
  visit('/customer/addresses')
  while pageeeeeeee.has_css?('.delete-address-button', wait: 3)
    first('.delete-address-button').click
    page.driver.browser.switch_to.alert.accept rescue nil
    sleep 1
  end
end