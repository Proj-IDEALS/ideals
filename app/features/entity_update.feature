Feature: update an entity
  As a user
  I want to edit theories, assumptions, and practice
  So that I can make modifications to the database

  Scenario: Edit an existing theory with a valid new description
    Given the following theories exist:
    | name      | description |
    | Theory 1  | Desc1       |
    When theory with name="Theory 1" is visited 
    When I click on a link containing the word edit
    Then I should see "Edit theory"
    And I should see textbox with id "theory_name" and value "Theory 1"

  Scenario: Edit an existing assumption with a valid new description
    Given the following assumptions exist:
    | name      | description |
    | Assumption 1  | Desc1       |
    When assumption with name="Assumption 1" is visited 
    When I click on a link containing the word edit
    Then I should see "Edit assumption"
    And I should see textbox with id "assumption_name" and value "Assumption 1"

  Scenario: Edit an existing practice with a valid new description
    Given the following practices exist:
    | name      | description |
    | Practice 1  | Desc1       |
    When practice with name="Practice 1" is visited 
    When I click on a link containing the word edit
    Then I should see "Edit practice"
    And I should see textbox with id "practice_name" and value "Practice 1"
