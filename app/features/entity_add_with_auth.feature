@selenium @auth
Feature: addobject_with_auth
  As a authorized user
  I want to create and view theories, assumptions, and practice after login with my account
  So that I can help build, setup and expand the database as a login user

  
  Scenario: Create a new theory as a login user
    Given I am on the new theory page as a login user
    When I fill in the theory form with valid data as a login user
    And I click the "Create Theory" button as a login user
    Then I should see the new theory's details as a login user


  Scenario: Create a new assumption as a login user
    Given I am on the new assumption page as a login user
    When I fill in the assumption form with valid data as a login user
    And I click the "Create Assumption" button as a login user
    Then I should see the new assumption's details as a login user


  Scenario: Create a new practice as a login user
    Given I am on the new practice page as a login user
    When I fill in the practice form with valid data as a login user
    And I click the "Create Practice" button as a login user
    Then I should see the new practice's details as a login user
