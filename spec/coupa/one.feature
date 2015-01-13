Feature: Visiting http://localhost:3000/departments
 
Scenario: Viewing application's home page
	Given Opening the url
	And Click new department link
	Then It should asking to fill required data

 Scenario: Adding new departments
    	Given Entering name as "CSE" and description taken from factory girl  
   	Then It should add the department with name "CSE"

 Scenario: Edit the exiting data
   	Given I click on the Edit link
   	And Update description with "this is account dept"
    	Then It should be updated 
  	And Back to the home page
	
 
