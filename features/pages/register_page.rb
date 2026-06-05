class RegisterPage
  include Capybara::DSL
  FIRST_NAME_TXT = 'FirstName'
  LAST_NAME_TXT = 'LastName'
  EMAIL_TXT = 'Email'
  COMPANY_TXT = 'Company'
  PASSWORD_TXT = 'Password'
  CONFIRM_PASSWORD_TXT = 'ConfirmPassword'
  REGISTER_BUTTON = '#register-button'

  def fill_register_form(firstname, lastname, email, company, password, confirm_password)
    fill_in FIRST_NAME_TXT, with: firstname
    fill_in LAST_NAME_TXT, with: lastname
    fill_in EMAIL_TXT, with: email
    fill_in COMPANY_TXT, with: company
    fill_in PASSWORD_TXT, with: password
    fill_in CONFIRM_PASSWORD_TXT, with: confirm_password
  end
  def click_register_button
    find(REGISTER_BUTTON).click
  end
end