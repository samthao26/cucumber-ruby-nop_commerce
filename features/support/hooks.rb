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
Before('@reset_password') do
  system('/reset_pw.sh')
  sleep 1
  visit 'http://localhost:8080/admin'
  fill_in 'Email', with: 'admin@test.com'
  fill_in 'Password', with: 'admin123'
  click_button 'Log in'
  visit 'http://localhost:8080/admin/customer/edit/8'
  fill_in 'Password', with: '123456'
  click_button 'Change password'
  visit 'http://localhost:8080/logout'

end
After('@add_address') do
  visit('/customer/addresses')
  while page.has_css?('.delete-address-button', wait: 3)
    first('.delete-address-button').click
    sleep 1
  end
end
After('@wishlist') do
  visit('/wishlist')
  while page.has_css?('.remove-btn', wait: 3)
    first ('.remove-btn').click
    sleep 1
  end
end
After('@cart') do
  visit('/cart')
  while page.has_css?('.remove-btn', wait: 3)
    first('.remove-btn').click
    sleep 1

  end
end
