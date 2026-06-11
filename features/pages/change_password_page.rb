class ChangePasswordPage
  include Capybara::DSL
  OLD_PW = "OldPassword"
  NEW_PW = "NewPassword"
  CONFIRM_PW = "ConfirmNewPassword"
  CHANGE_PW_BUTTON = ".change-password-button"
  PW_LINK = '.change-password a'
  def access_pw_link
    find(PW_LINK).click
  end
  def fill_change_pw_form(old_password, new_password, confirm_password)
    fill_in OLD_PW, with: old_password
    fill_in NEW_PW, with: new_password
    fill_in CONFIRM_PW, with: confirm_password
  end
  def click_change_pw_button
    find(CHANGE_PW_BUTTON).click
  end
end