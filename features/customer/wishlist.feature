Feature: Add product to wishlist
  As a registered user
  I want to add items to my wishlist
  So that I can save them to buy later

  Background: User logged
    Given I open demo nonCommerce homepage
    And I navigate to Login page
    And I fill in login form with "automation1@gmail.com", "123456"
    And I click on "Log in" button

  Scenario: WL_01 - Successfully adding an in-stock item to wishlist
    Given I search for product "Lenovo ThinkPad X1 Carbon"
    And I navigate to the product details page
    And I click Add to wishlist button
    Then I should see a successfully message "The product has been added to your wishlist"
    And I navigate to wishlist page
    Then I should see "Lenovo ThinkPad X1 Carbon" in wishlist page

  Scenario: WL_02 - Add product to cart from wishlist page
    Given I search for product "Lenovo ThinkPad X1 Carbon"
    And I navigate to the product details page
    And I click Add to wishlist button
    When I navigate to wishlist page
    And I select checkbox of "Lenovo ThinkPad X1 Carbon"
    And I click Add to cart button
    Then I should see "Lenovo ThinkPad X1 Carbon" removed from wishlist page
    When I navigate to shopping cart page
    Then I should see "Lenovo ThinkPad X1 Carbon" in shopping cart page


  Scenario: WL_03 - Successfully removing a product in wishlist page
    Given I search for product "Lenovo ThinkPad X1 Carbon"
    And I navigate to the product details page
    And I click Add to wishlist button
    And I navigate to wishlist page
    And I click remove button of "Lenovo ThinkPad X1 Carbon"
    Then I should see "Lenovo ThinkPad X1 Carbon" removed from wishlist page