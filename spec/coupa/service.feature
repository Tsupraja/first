Feature: checking whether Quantity is increasing when the service is saved
 Background:logging into sail.coupa page 
         Given I am on login page of coupa
         Then I enter valid login details
         And Press Sign In button
         Then Home page should be viewed
 Scenario:opening the Review cart page which is on top of home page       
         Given In home page click on cart link
         Then  Review Cart should be opened        
         Given Click on add line 
         And Choose service
         Then enter item,supplier,price values
         And press save button
         Then checking quantity number is same or not