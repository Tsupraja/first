Feature:deleting the given department
Scenario: opening localhost
     Given I am opening localhost
 Scenario:creating new department    
      Given there's a Department name with description
Scenario:checking name and description
      Given the name  and description should be same what we gave
Scenario:deleting given department
     Given the Department  which is creating before should be Destroy
     Then conforming to delete the given department
Scenario:checking whether it is deleted or not
      Given checking whether it is deleted or not