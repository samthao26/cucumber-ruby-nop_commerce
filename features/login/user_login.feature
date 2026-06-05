Feature: User login
  As user who has account already
  I want to login to my account
  So that I can shop and manager my account

  Background:
    Given I open demo nonCommerce homepage
    And I navigate to Login page

  Scenario: TC_01- Login with empty data
      When I click on "Log in" button
      Then I should see error message
      |Please enter your email|
  Scenario Outline: <case_id> Login with invalid data
      When I fill in login form with "<email>", "<password>"
      Then I click on "Log in" button
      Then I should see error message "<error_login_message>"
      Examples:
        | case_id | email                 | password | error_login_message                    |
        | TC_02   | automationfc          | 123456   | Please enter a valid email address.    |
        | TC_03   | automation2@gmail.com | 123456   | No customer account found              |
        | TC_04   | automation1@gmail.com | 1234562  | The credentials provided are incorrect |
        | TC_05   | automation1@gmail.com |          | The credentials provided are incorrect |
  Scenario: TC_06-Login successfully
        When I fill in login form with "automation1@gmail.com", "123456"
        Then I click on "Log in" button
        Then I should see "Log out" link




