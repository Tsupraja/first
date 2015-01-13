Feature:  visiting  coupa page
Scenario: To visit coupa page
Given I am on login page of coupa
    Then I enter valid login details
     And Press Sign In button
    Then Home page should be viewed
Given I click orders tabThen  Purchase Orders page should be opened
    When I click on AB00001555 link
    Then   Purchase Order page should opened
    When I click invoice link
    Then  Create Invoice page should be opened
Given I enter all required details  
     And press submit button
     Then  Invoices page should be opened by creating
     
   
  Then  2Purchase Orders page should be opened
    When 2I click on AB00001555 link
    Then   2Purchase Order page should opened
    When 2I click invoice link
    Then 2Create Invoice page should be opened
Given 2I enter all required details  
     And 2press submit button
     Then  2Invoices page should be opened by creating
And I press sign out link
Then It should redireted to main page     






