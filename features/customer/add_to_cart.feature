Feature: Add product to cart
  As a registered user
  I want to add items to cart
  so that I can buy it

  Background: User logged
    Given I open demo nonCommerce homepage
    And I navigate to Login page
    And I fill in login form with "automation1@gmail.com", "123456"
    And I click on "Log in" button

  Scenario:ATC_01 - Add item to cart
    Given I search for product "Apple MacBook Pro 14"

    And I navigate to the product details page
    And I click Add to cart button
    Then I should see a successfully add_to_cart message "The product has been added to your shopping cart"
    And I navigate to shopping cart page
    And I should see "Apple MacBook Pro 14" in shopping cart page

  Scenario Outline: <ATC_Id> Edit product in shopping cart
    Given  I search for product "Apple MacBook Pro 14"
    And I navigate to the product details page
    And I click Add to cart button
    And I navigate to shopping cart page
    Then I click to <direction> button of "Apple MacBook Pro 14",
    Then I should see correct total price for "Apple MacBook Pro 14"

    Examples:
      | ATC_Id | direction |
      | ATC_02 | up       |
      | ATC_03 | down     |

 Scenario: ATC_04 - Remove item from cart
   Given I search for product "Lenovo ThinkPad X1 Carbon"
   And I navigate to the product details page
   And I click Add to cart button
   And I navigate to shopping cart page
   And I click remove button of "Lenovo ThinkPad X1 Carbon" from shopping cart
   Then I should see "Lenovo ThinkPad X1 Carbon" removed from shopping cart page






