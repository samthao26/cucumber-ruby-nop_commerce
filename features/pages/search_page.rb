class SearchPage
  include Capybara::DSL
  include RSpec::Matchers
  SEARCH_PAGE_URL = '/search'
  SEARCH_TEXT_BOX = 'small-searchterms'
  SEARCH_BUTTON = '.search-box-button'
  SEARCH_BUTTON_PAGE = '.button-1.search-button'
  ADVANCED_CHECKBOX = '#advs'
  SUB_CATEGORY = 'isc'
  CATEGORIES_DROPDOWN = 'cid'
  MANUFACTURER_DROPDOWN = 'mid'
  PRODUCT_TITLE = '.product-title a'
  ERROR_MESSAGE = '.search-results .no-result'

  def fill_in_search_box(keyword)
    fill_in SEARCH_TEXT_BOX, with: keyword
  end
  def select_category(category)
    select category, from: CATEGORIES_DROPDOWN
  end
  def select_manufacturer(manufacturer)
    select manufacturer, from: MANUFACTURER_DROPDOWN
  end
  def sub_categories(check_status)
    if check_status.downcase =='checked'
      check SUB_CATEGORY
    else
      uncheck SUB_CATEGORY
    end
  end
  def enable_advanced_search
    find(ADVANCED_CHECKBOX).click unless find(ADVANCED_CHECKBOX).checked?
  end
  def fill_search_form(data)

    enable_advanced_search if data['Advanced_search'] == 'Checked'
    select_category(data['Category']) if data['Category']
    select_manufacturer(data['manufacturer']) if data['manufacturer']
    sub_categories(data['sub_categories']) if data['sub_categories']
  end
  def submit_search
    if current_url.include?('/search')
    find(SEARCH_BUTTON_PAGE).click
    else find(SEARCH_BUTTON).click
    end
  end
  def verify_search_results(search_result)
    expect(page).to have_css(PRODUCT_TITLE, text: search_result)

  end
  def error_message(message)
    alert = page.driver.browser.switch_to.alert
    expect(alert.text).to eq(message)
    alert.accept
    rescue Selenium::WebDriver::Error::NoSuchAlertError
    expect(page).to have_content(message)
  end
  def navigate_to_search_page
    visit SEARCH_PAGE_URL
  end

end