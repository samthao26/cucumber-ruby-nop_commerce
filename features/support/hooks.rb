Before do
  @register_page = RegisterPage.new
  @login_page = LoginPage.new
  @customer_info_page = CustomerInfoPage.new
  @my_account_addresses_page = MyAccountAddressesPage.new
  @change_password_page = ChangePasswordPage.new
  @product_review_page = ProductReviewPage.new
  @search_page = SearchPage.new
  @wishlist_page = WishlistPage.new
  @add_to_cart_page = AddToCartPage.new
end
After('@add_address') do
  visit('/customer/addresses')
  while page.has_css?('.delete-address-button', wait: 3)
    first('.delete-address-button').click
    page.driver.browser.switch_to.alert.accept rescue nil
    sleep 1
  end
end
