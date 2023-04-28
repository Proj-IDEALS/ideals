Feature: addobject
  As a user
  I want to create and view theories, assumptions, and practice
  So that I can help build, setup and expand the database

  @selenium
  Scenario: Create a new theory with valid data
    Given I am on the new theory page
    When I fill in the theory form with valid data
    And I click the "Create Theory" button
    Then I should see the new theory's details

  Scenario: Create a new theory with empty data
    Given I am on the new theory page
    When I click the "Create Theory" button
    Then I should see "Name can't be blank"

  @selenium
  Scenario: Create a new assumption with valid data
    Given I am on the new assumption page
    When I fill in the assumption form with valid data
    And I click the "Create Assumption" button
    Then I should see the new assumption's details

  Scenario: Create a new assumption with empty data
    Given I am on the new assumption page
    When I click the "Create Assumption" button
    Then I should see "Name can't be blank"

  @selenium
  Scenario: Create a new practice with valid data
    Given I am on the new practice page
    When I fill in the practice form with valid data
    And I click the "Create Practice" button
    Then I should see the new practice's details

  Scenario: Create a new practice with empty data
    Given I am on the new practice page
    When I click the "Create Practice" button
    Then I should see "Name can't be blank"
