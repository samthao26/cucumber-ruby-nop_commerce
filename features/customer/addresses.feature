Scenario:  TC_02- Add new address with empty data
When I click on "Addresses" link
And I click on "Add new" button
And I click on "Save" button
Then I should see error message
|First name is required.|
|Last name is required. |
|Email is required.     |
|City is required       |
|Street address is required|
|Zip / postal code is required|
|Phone is required            |

