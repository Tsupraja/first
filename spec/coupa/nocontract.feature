Feature:Set ‘Route requisitions to buyer-if no contract is specified-always’ in company information page and submit a requisition with an item that had no contract
Background:I am opening the home page of coupa
          Given Open the login page of coupa
          Then Enter the valid user name and password 
          And press signin button to login 
          Then Sign out link should be present
 Scenario:Creating requisition to buyer with supplier that have no contract
          Given click on setup tab and setup page should be opened
         And click on Company information link and company information page should be opened
         Then  click Route requisitions to buyer if no contract is specified on that checkbox
         And saving the company_information after some changes
         Given In home page click on cart link which is on right side of home page
         Then  Review Cart page  should be opened 
         Then Enter the ship in address at top of review page
         And Click on add line link at below 
         And Choose item in radio buttons 
         And Enter itemname,supplier,prices,commodity
         Then press save button to save item 
         Given fill the Accounting details in cartlist section
         And click on submit for approval
         Then It will redirect to home page after given to approval
