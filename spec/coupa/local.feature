Feature:  visiting http://localhost/departments 
Scenario: opening localhost
     Given I am opening localhost
Scenario: creating new department    
      Given there's a Department name with description
      Then there's a Department name with description second
Scenario:checking name and description
      Given the name  and description should be same what we gave
Scenario:givening only description
      Given I enter the given description "coumputer"      
 
