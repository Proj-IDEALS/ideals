Feature: Display Theory and Practice for connection

  As a site owner,
  So that I can select theories and practice to connect with assumptions
  I want to be able to see a list of valid selectable theories and practice

  Scenario: Select Theories and Practices for an Assumption
    Given I have the following theories:
      | name     |
      | Theory1  |
      | Theory2  |
      | Theory3  |
    And I have the following practices:
      | name     |
      | Practice1|
      | Practice2|
      | Practice3|
    And I am on the new assumption page
    When I enter "Test Assumption" as the assumption name
    And I select "Theory1" and "Theory3" as theories
    And I select "Practice1" and "Practice2" as practices
    And I click on the "Create Assumption" button
    Then I should see the selected theories and practices associated with the assumption
