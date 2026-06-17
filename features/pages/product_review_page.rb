class ProductReviewPage
  include Capybara::DSL
  include RSpec::Matchers

  REVIEW_TITLE = 'AddProductReview_Title'
  REVIEW_TEXT = 'AddProductReview_ReviewText'

  RATING_OPTIONS = {
    'Bad' => 'addproductrating_1',
    'Not good' => 'addproductrating_2',
    'Not bad but also not excellent' => 'addproductrating_3',
    'Good' => 'addproductrating_4',
    'Excellent' => 'addproductrating_5',
  }.freeze
  ACCESS_PRODUCT_DETAILS_LINK = '.product-title a'
  ACCESS_PRODUCT_REVIEWS_LINK = '.customer-reviews a'
  #verify review
  REVIEW_ITEM = '.product-review-item'
  REVIEW_TITLE_VERIFY = '.review-title strong'
  REVIEW_TEXT_PRODUCT_VERIFY ='.text-body'
  REVIEW_TEXT_ACCOUNT_VERIFY = '.review-text'
  RATING_VERIFY = '.rating div'
  SUBMIT_REVIEW_BUTTON = '#add-review'
  def fill_in_review(data)
    fill_in REVIEW_TITLE, with: data['review_title']
    fill_in REVIEW_TEXT, with: data['review_text']
  end
  def select_rate(rating_option)
    find("##{RATING_OPTIONS[rating_option]}").click
  end
  def verify_existing_review(data)
    review = page.all(REVIEW_ITEM).last
    expect(review.find(REVIEW_TITLE_VERIFY).text).to include(data['review_title'])
    expect(review.find(REVIEW_TEXT_PRODUCT_VERIFY).text).to include(data['review_text'])
    standard_key = RATING_OPTIONS.keys.find{|k| k.downcase == data['review_rating'].to_s.downcase}
    rating_id = RATING_OPTIONS[standard_key]
    rating_num = rating_id[-1].to_i
    width_expected = "#{rating_num* 20}%"
    expect(review.find(RATING_VERIFY)['style']).to include(width_expected)

  end
  def verify_product_review(data)
    review = page.all(REVIEW_ITEM).last
    expect(review.find(REVIEW_TITLE_VERIFY).text).to include(data['review_title'])
    expect(review.find(REVIEW_TEXT_ACCOUNT_VERIFY).text).to include(data['review_text'])
    standard_key = RATING_OPTIONS.keys.find{|k| k.downcase == data['review_rating'].to_s.downcase}
    rating_id = RATING_OPTIONS[standard_key]
    rating_num = rating_id[-1].to_i
    width_expected = "#{rating_num* 20}%"
    expect(review.find(RATING_VERIFY)['style']).to include(width_expected)

    end
  def access_review_page
    find(ACCESS_PRODUCT_REVIEWS_LINK).click
  end
  def access_product_details_page
    find(ACCESS_PRODUCT_DETAILS_LINK).click
  end
  def submit_review
    find(SUBMIT_REVIEW_BUTTON).click
  end
end