Feature: User addresses management
  As a registered user
  I want to add new addresses to my account
  So that I can manage my addresses

  Background: User is logged and navigates to addresses page
    Given I open demo nonCommerce homepage
    And I navigate to Login page
    And I fill in login form with "automation1@gmail.com", "123456"
    And I click on "Log in" button
    And I click on "My account" link
    And I access Addresses tab from Sidebar menu
    And I click on Add new addresses button
    Then I should see addresses form


  Scenario:  TC_01- Add new address with empty data
    When I click on "Save" button
    Then I should see error message
      | First name is required.       |
      | Last name is required.        |
      | Email is required.            |
      | City is required              |
      | Street address is required    |
      | Zip / postal code is required |
      | Phone is required             |

  Scenario: TC_02-Add new address with invalid email
    When I fill in address form with:
      | first_name | Automation               |
      | last_name  | FC                       |
      | email      | automationfc             |
      | company    | Sonant Tech              |
      | country    | United States of America |
      | state      | California               |
      | city       | San Diego                |
      | address1   | 5396 North Reese Avenue  |
      | address2   | Fresno CA 93722          |
      | zip        | 93722                    |
      | phone      | +16316981319             |
      | fax        | +16316981319             |
    Then I click on "Save" button
    Then I should see error message "Please enter a valid email address."
@add_address
  Scenario Outline: : <case_id>-Add address with country that has states
    When i fill in address form with:
      | first_name | Automation            |
      | last_name  | FC                    |
      | email      | automation1@gmail.com |
      | company    | Sonant Tech           |
      | country    | <country>             |
      | state      | <state>               |
      | city       | <city>                |
      | address1   | <address1>            |
      | address2   | <address2>            |
      | zip        | <zip>                 |
      | phone      | <phone>               |
      | fax        | <fax>                 |
    Then I click on "Save" button
    Then I should see addresses saved correctly:
      | first_name | Automation            |
      | last_name  | FC                    |
      | email      | automation1@gmail.com |
      | company    | Sonant Tech           |
      | country    | <country>             |
      | state      | <state>               |
      | city       | <city>                |
      | address1   | <address1>            |
      | address2   | <address2>            |
      | zip        | <zip>                 |
      | phone      | <phone>               |
      | fax        | <fax>                 |
    Examples:
      | case_id | country                  | state      | city      | address1                | address2        | zip   | phone        | fax         |
      | TC_03   | United States of America | California | San Diego | 5396 North Reese Avenue | Fresno CA 93722 | 93722 | +16316981319 | 16316981319 |
      | TC_04   | Vietnam                  | Hà Nội     | Hà Nội    | 123 Hoàng Diệu          | Hoang Mai       | 10000 | +84912345678 | 16316981319 |
@add_address
  Scenario: TC_05- Add address with country has no state
    When I fill in address form with:
      | first_name | Automation            |
      | last_name  | FC                    |
      | email      | automation1@gmail.com |
      | company    | Sonant Tech           |
      | country    | Åland Islands         |
      | state      | Other                 |
      | city       | Mariehamn             |
      | address1   | Test Street 1         |
      | address2   |                       |
      | zip        | 22100                 |
      | phone      | +16316981319          |
      | fax        | 16316981319           |
    And I click on "Save" button
    Then I should see addresses saved correctly:
      | first_name | Automation            |
      | last_name  | FC                    |
      | email      | automation1@gmail.com |
      | company    | Sonant Tech           |
      | country    | Åland Islands         |
      | state      | Other                 |
      | city       | Mariehamn             |
      | address1   | Test Street 1         |
      | address2   |                       |
      | zip        | 22100                 |
      | phone      | +16316981319          |
      | fax        | 16316981319           |

