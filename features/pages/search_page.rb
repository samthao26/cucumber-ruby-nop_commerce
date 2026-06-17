class SearchPage
  include Capybara::DSL
  SEARCH_TEXT_BOX = 'small-searchterms'
  SEARCH_BUTTON = '.search-box-button'
  def fill_in_search_form(product_name)
    fill_in SEARCH_TEXT_BOX, with: product_name
    find(SEARCH_BUTTON).click

    end
end