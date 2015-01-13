Feature:  visiting  coupa page
Scenario: To visit coupa page
Given I am on login page of coupa
    Then I enter valid login details
     And Press Sign In button
    Then Home page should be viewed
Given I clicked Setup tab
     Then Setup page should be opened 
When I click  Chart of accounts
      Then  Chart of Accounts page should be opened
  
Given Edit new  Chart Of Account
Then Delete new  Chart Of Account 
And I press sign out link
Then It should redireted to main page
     