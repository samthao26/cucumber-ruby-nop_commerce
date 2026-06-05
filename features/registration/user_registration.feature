Feature: User Registration
  As a new visitor to nopCommerce
  I want to register an account
  So that I can shop and manage my orders

  Background:
    Given I open demo nonCommerce homepage
    And I navigate to Register page

  Scenario: TC_01-Register with empty data
    And I click on "Register" button
    Then I should see error messages
      | First name is required. |
      | Last name is required.  |
      | Email is required.      |
      | Password is required.   |

  Scenario Outline:  <case_id> - Register with invalid data
    When I fill in register form with "<firstname>", "<lastname>", "<email>", "<company>", "<password>", "<confirm_password>"
    Then I click on "Register" button
    Then I should see error message "<error_message>"

    Examples:
      | case_id | firstname  | lastname | email                | company     | password | confirm_password | error_message                                                                                               |
      | TC_02   | Automation | FC       | automationfc         | Sonant Tech | 123456   | 123456           | Please enter a valid email address.                                                                         |
      | TC_04   | Automation | FC1      | automation@gmail.com | Sonant Tech | 123456   | 123456           | The specified email already exists                                                                          |
      | TC_05   | Automation | FC1      | automation@gmail.com | Sonant Tech | 12345    | 12345            | Password must meet the following rules: must have at least 6 characters and not greater than 64 characters  |
      | TC_06   | Automation | FC       | automation@gmail.com | Sonant Tech | 123456   | 12345            | The password and confirmation password do not match.                                                        |


  Scenario: TC_03 - Register with valid data successful
    When I fill in register form with "Automation", "FC", "RANDOM", "Sonant Tech", "123456", "123456"
    And I click on "Register" button
    Then I should see success message "Your registration completed"