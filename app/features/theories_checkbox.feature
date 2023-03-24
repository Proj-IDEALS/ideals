Feature: Display Assumptions for connection

  As a site owner,
  So that I can select assumptions to connect with theories
  I want to be able to see a list of valid selectable assumptions

  Scenario: Select Assumptions for a Theory
    Given I have the following assumptions:
      | name       |
      | Assumption1|
      | Assumption2|
      | Assumption3|
    And I am on adding new theory page
    When I enter "Test Theory" as the theory name
    And I select "Assumption1" and "Assumption3" as assumptions
    And I click this "Create Theory" button
    Then I should see the selected assumptions associated with the theory

