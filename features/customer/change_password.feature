Feature: User change password
  As a register user
  I want to change new password
  so that I can secure my account

  Background: User logged and navigate to Change Password
    When I open demo nonCommerce homepage
    And I navigate to Login page
    And I fill in login form with "automation1@gmail.com", "123456!"
    And I click on "Log in" button
    And I click on "My account" link
    And I access Change Password tab from sidebar menu


  Scenario: PW_TC_01- Change password with empty data
    When I click on "Change password" button
    Then I should see pw_error_message:
      | Old password is required. |
      | Password is required.     |


  Scenario Outline: <pw_case_id>-Change password with invalid password
    When I fill in Change password with "<old_password>","<new_password>","<confirm_password>"
    And I click on "Change password" button
    Then I should see "<pw_error_message>"
    Examples:
      | pw_case_id | old_password | new_password | confirm_password | pw_error_message                                                                                           |
      | PW_TC_02   | Password123! | 12345678     | 12345678         | Old password doesn't match                                                                                 |
      | PW_TC_03   | 123456       | 12345        | 12345            | Password must meet the following rules: must have at least 6 characters and not greater than 64 characters |
      | PW_TC_04   | 123456       | 123456       | 1234567          | The new password and confirmation password do not match.                                                   |
      | PW_TC_05   | 123456       | 123456       | 123456           | You entered the password that is the same as one of the last passwords you used.                           |

  Scenario: PW_TC_06- Change password successfully with valid data
    When I fill in Change password with "123456","NewPass@2026","NewPass@2026"
    And I click on "Change password" button
    Then I should see success message "Password was changed"

    When I click on "Log out" link
    And I navigate to Login page
    And I fill in login form with "automation1@gmail.com", "NewPass@2026"
    And I click on "Log in" button
    Then I should see "Log out" link
# need to reset password via admin
  #visit 'http://localhost:8080/admin'
  #admin@test.com/admin123
  #podman exec -it $(podman ps -q --filter "ancestor=mcr.microsoft.com/mssql/server:2022-latest") /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P nopCommerce_db_v1 -C -Q "
  #WHILE (SELECT COUNT(*) FROM [nopcommerce].[dbo].[CustomerPassword] WHERE CustomerId = 8) > 1
  #BEGIN
  #  DELETE FROM [nopcommerce].[dbo].[CustomerPassword]
  #  WHERE CustomerId = 8
  #  AND Id != (SELECT MAX(Id) FROM [nopcommerce].[dbo].[CustomerPassword] WHERE CustomerId = 8)
  #END"
