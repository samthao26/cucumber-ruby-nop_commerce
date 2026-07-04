class AddToCartPage
  include RSpec::Matchers
  include Capybara::DSL
  QUANTITY_UP = '[id^="quantity-up"]'
  QUANTITY_DOWN = '[id^="quantity-down"]'
  ADD_TO_CART_BUTTON = '.add-to-cart-button'
  REMOVE_BUTTON = '.remove-btn'
  PRODUCT_SUBTOTAL ='.product-subtotal'
  UNIT_PRICE ='.product-unit-price'
  ITEM_QUANTITY = '.qty-input'
  PRODUCT_NAME = '.cart .product-name'
  def find_cart_row(product_name)
    find('tr', text: product_name)
  end
  def add_item_to_cart_page
    find(ADD_TO_CART_BUTTON).click
  end
  def click_quantity(product_name, direction)
    case direction
    when 'up'
      find_cart_row(product_name).find(QUANTITY_UP).click
      when 'down'
        find_cart_row(product_name).find(QUANTITY_DOWN).click
      end
      sleep(2)
      end

  def remove_item_from_cart_page(product_name)
    find_cart_row(product_name).find(REMOVE_BUTTON).click
    expect(page).not_to have_css('tr', text: product_name, wait: 5)
  end
def verify_item_moved_out_shopping_cart_page(product_name)
  expect(page).not_to have_css(PRODUCT_NAME, text: product_name,wait: 5)


  end

  def verify_total_price(product_name)
    row = find_cart_row(product_name)
    unit_price = row.find(UNIT_PRICE).text.gsub(/[$,]/,'').to_f
    quantity = row.find(ITEM_QUANTITY).value.to_i
    expected = (unit_price * quantity).round(2)
    using_wait_time(5) do
    actual = row.find(PRODUCT_SUBTOTAL).text.gsub(/[$,]/,'').to_f
    expect(actual).to eq(expected)

  end
  end
  end

