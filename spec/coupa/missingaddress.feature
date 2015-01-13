Feature:sending the request with out given ship to address and finding text 'Buyer Action Pending' was displayed in the approval chain of review cart page
                 Preconditions create supplier with Draft supplier and Supplier without contract

Background:I am opening the home page of coupa
          Given Open the login page of coupa
          Then Enter the valid user name and password 
          And press signin button to login 
          Then Sign out link should be present
 
Scenario:opening the Review cart page which is on top of home page       
         Given In home page click on cart link which is on right side of home page
         Then  Review Cart page  should be opened        
         Given In Review page Click on add line 
         And then Choose item in radio buttons
         Then enter item,supplier,Commodity,price
         And click on save button
         And click on Submit for Approval
         Then checking the test case process is passed or not
