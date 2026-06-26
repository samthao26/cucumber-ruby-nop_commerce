class WishlistPage
  include Capybara::DSL
  include RSpec::Matchers
  ADD_TO_WISHLIST_BUTTON = '.add-to-wishlist-button'
  WISHLIST_URL = '/wishlist'
  PRODUCT_NAME = '.wishlist-content .product-name'
  ADD_TO_CART_CHECKBOX = '.add-to-cart'
  SELECT_CHECKBOX ="input[name='addtocart']"
  REMOVED_BUTTON = '.remove-btn'
  UPDATE_BUTTON = '#updatecart'
  ADD_TO_CART_BUTTON = '.wishlist-add-to-cart-button'
  CART_URL = '/cart'
  CART_PRODUCT_NAME = '.cart .product-name'
  def click_add_to_wishlist
    find(ADD_TO_WISHLIST_BUTTON).click
  end
  def navigate_to_wishlist_page
    visit WISHLIST_URL
  end
  def navigate_to_cart_page
    visit CART_URL
  end
def verify_product_not_in_wishlist(product_name)
    expect(page).not_to have_css(PRODUCT_NAME, text: product_name, wait: 5)
  end
  def verify_product_in_wishlist(product_name)
    expect(page).to have_css(PRODUCT_NAME, text: product_name)
  end
  def verify_product_in_cart(product_name)
    expect(page).to have_css(CART_PRODUCT_NAME, text: product_name)
  end
  def add_to_wishlist
    find(ADD_TO_WISHLIST_BUTTON).click

  end
  def add_to_cart_button
    find(ADD_TO_CART_BUTTON).click
  end
  def select_product_checkbox(product_name)
    row = find('tr', text: product_name)
      row.find(ADD_TO_CART_CHECKBOX).click
  end
def remove_from_wishlist(product_name)
  row = find('tr', text: product_name)
  row.find(REMOVED_BUTTON).click
  expect(page).not_to have_css('tr', text: product_name, wait: 5)
end
end