Feature:Going to create invoice to one purchase order
Background: To open the home page of coupa
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
         And checking wheather dell_1212 is saved or not
         Then Adding the address for shipping
         Then filling Accounting data clicking submit for approval
         Then check whether that it item is there are not and clicking bypass

Scenario:opening the invoice page to create an invoice
         Given In home page clicking invoice tab
         Then In invoice page clicking on Pick lines from PO link
         And pick your supplier and add in invoice table
         Then creating invoice to supplier which you add
         Then checking it is created or not