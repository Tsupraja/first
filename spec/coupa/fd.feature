Feature:  Adding a new department
Scenario: Opening the home page 
     Given I am on login page of coupa
      When I enter valid login details
      And Press Sign In button 
     Then Home page should be viewed
Scenario: navigating to Administration page 
      When I press Setup tab
      Then Administration page should viewed  
Scenario: Add new Department       
      When I click Departments link
      Then  Departments page should viewed
      When I press create button
      Then  Department Create page should be viewed
      When I enter Department name 
      And press save button
      Then Department page should be viewed by saving
      When I press sign out link
      Then It should redireted to main page
 
      
      


      
