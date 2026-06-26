Feature: User search/advanced search
  As a registered user
  I want to search products
  So that I can quickly find the exact items I need

  Background: User is logged and search products
    Given I open demo nonCommerce homepage

  Scenario Outline: <S_ID> - Search with invalid data: <title>
    Given I fill in search box with "<invalid_data>"
    And I click on Search button
    Then I should see"<s_error_message>"
    Examples:
      | S_ID | title                  | invalid_data     | s_error_message                                    |
      | S_01 | Empty keyword          |                  | Please enter some search keyword                   |
      | S_02 | Non-existed product    | Macbook Pro 2050 | No products were found that matched your criteria. |
      | S_03 | Less than 3 characters | Le               | Search term minimum length is 3 characters         |

  Scenario: S_04 - Search with fuzzy match product name
    Given I fill in search box with "Samsung"
    And I click on Search button
    Then I should see these product listed
      | Samsung 27 Monitor |
      | Samsung T7 SSD     |

  Scenario: S_05 - Search with exact math product name
    Given I fill in search box with "Lenovo ThinkPad X1 Carbon"
    And I click on Search button
    Then I should see "Lenovo ThinkPad X1 Carbon"

  Scenario Outline: <S_ID> - Advanced search by <title>
    Given I fill in search box with "Apple MacBook Pro"
    And I click on Search button
    And I fill in search form with
      | Advanced_search | Checked           |
      | Category        | Computers         |
      | sub_categories  | <check_status>    |
    And I click on Search button
    Then I should see "<search_result>"
    Examples:
      | S_ID | title             | check_status | search_result                                      |
      | S_06 | parent categories | uncheck      | No products were found that matched your criteria. |
      | S_07 | sub categories    | checked      | Apple MacBook Pro 14                               |

  Scenario Outline: <S_ID> - Advanced search by manufacturer <title>
    Given I fill in search box with "Apple MacBook Pro"
    And I click on Search button
    And I fill in search form with
      | Advanced_search | Checked           |
      | Category        | Computers         |
      | sub_categories  | checked           |
      | manufacturer     | <brand_name>      |
    And I click on Search button
    Then I should see "<search_result>"
    Examples:
      | brand_name | S_ID | title                 | search_result                                      |
      | Dell       | S_08 | incorrect manufacture | No products were found that matched your criteria. |
      | Apple      | S_09 | correct manufacture   | Apple MacBook Pro 14                               |










