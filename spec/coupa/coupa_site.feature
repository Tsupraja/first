Feature:  visiting  coupa page
Scenario: To visit coupa page
Given I am on login page of coupa
    Then I enter valid login details
     And Press Sign In button
    Then Home page should be viewed
 When I clicked Expenses tab
    Then Expenses page should be opened
     And I press sign out link
    Then It should redireted to main page
     
   