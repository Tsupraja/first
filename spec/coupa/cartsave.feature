Feature: checking whether Supplier, Commodity, Price are automatically  updated or not
 Background:logging into sail.coupa page 
         Given I am on login page of coupa
         Then I enter valid login details
         And Press Sign In button
         Then Home page should be viewed
 Scenario:opening the Review cart page which is on top of home page       
         Given In home page click on cart link
         Then  Review Cart should be opened        
         Given Click on add line 
         And Choose item 
         Then enter item name is "dell_1212"
         Then entering the Supplier "dell company" Commodity "Laptops" Price "32,000.00" 
         Then enter remaining values
         And press save button
         Given checking the card no is changed or not
         And checking weather dell_1212 is saved or not
         Then I press sign out link
         And It should redireted to main page