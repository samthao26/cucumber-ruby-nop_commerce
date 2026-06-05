class LoginPage
  include Capybara::DSL
  EMAIL_LOGIN_TEXT = 'Email'
  PASS_LOGIN_TEXT = 'Password'
  LOGIN_BUTTON = '.login-button'

  def fill_login_form(email, password)
    fill_in EMAIL_LOGIN_TEXT, with: email
    fill_in PASS_LOGIN_TEXT, with: password
  end
  def click_login_button
    find(LOGIN_BUTTON).click
  end
end
