class CustomerInfoPage
  include Capybara::DSL
  GENDER_OPTIONS = {
    'Male' =>'gender-male',
    'Female' => 'gender-female'
  }
  FIRST_NAME_INFO  = 'FirstName'
  LAST_NAME_INFO  = 'LastName'
  COMPANY_NAME_INFO = 'Company'
  SAVE_BUTTON = 'save-info-button'
  def select_gender(gender)
    find("##{GENDER_OPTIONS[gender]}").click
  end
  def change_form(firstname, lastname, company)
    fill_in FIRST_NAME_INFO, with: firstname
    fill_in LAST_NAME_INFO, with: lastname
    fill_in COMPANY_NAME_INFO, with: company
  end
  def click_save_form
    find(SAVE_BUTTON).click
  end
end
