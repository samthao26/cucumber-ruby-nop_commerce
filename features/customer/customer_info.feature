Feature: Customer information management
  As a registered user
  I want to update my personal information
 So that my account profile details are always accurate

  Background: User is logged in and navigates to Customer Info
    Given I open demo nonCommerce homepage
    And I navigate to Login page
    And I fill in login form with "automation1@gmail.com", "123456"
    And I click on "Log in" button
    And I click on "My account" link
    Then I should be redirected to Customer Info page

    Scenario: TC_01- Update customer info with valid data

      When I select gender as "Female"
      And I enter First Name "Automation1", Last Name "FC" and company "Sonant tech1"
      And I click on "Save" button
      Then I should see field updated correctly with "Female","Automation1", Last Name "FC" and company "Sonant tech1"







