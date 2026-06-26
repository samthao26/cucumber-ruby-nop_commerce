Feature: User product reviews management
  As a registered user
  I want to write reviews for products
  So that I can view my review history in my account

  Background: User logged and navigated to product reviews
    Given I open demo nonCommerce homepage
    And I navigate to Login page
    And I fill in login form with "automation1@gmail.com", "123456"
    And I click on "Log in" button
    And I search for product "Lenovo ThinkPad X1 Carbon"
    And I navigate to the product details page

  Scenario: RV_01 - Add product review with empty data
    When I click Submit review button
    Then I should see PR_error_messages:
      | Review title is required. |
      | Review text is required.  |

  Scenario: RV_02- Add product reviews successful
    When I fill in reviews form with:
      | review_title | Great laptop                           |
      | review_text  | Really good product, highly recommend. |
    And I select rating "Good"
    And I click Submit review button
    Then I should see success message "Product review is successfully added."
    And I should see my new review displays in the Existing Reviews section:
      | review_title  | Great laptop                           |
      | review_text   | Really good product, highly recommend. |
      | review_rating | good                                   |
    When I click on "My account" link
    And I click on Product reviews on sidebar
    Then I should see my submitted review listed in My product reviews

      | review_title  | Great laptop                           |
      | review_text   | Really good product, highly recommend. |
      | review_rating | good                                   |


