Feature: update an entity
  As a user
  I want to edit theories, assumptions, and practice
  So that I can make modifications to the database

  Scenario: Reach the right edit page for the existing theory
    Given the following theories exist:
    | name      | description |
    | Theory 1  | Desc1       |
    When root page of theory with name="Theory 1" is visited 
    When I click on a link containing the word edit
    Then I should see "Edit theory"
    And I should see textbox with id "theory_name" and value "Theory 1"

  Scenario: Reach the right edit page for the existing assumption
    Given the following assumptions exist:
    | name      | description |
    | Assumption 1  | Desc1       |
    When root page of assumption with name="Assumption 1" is visited 
    When I click on a link containing the word edit
    Then I should see "Edit assumption"
    And I should see textbox with id "assumption_name" and value "Assumption 1"

  Scenario: Reach the right edit page for the existing practice
    Given the following practices exist:
    | name      | description |
    | Practice 1  | Desc1       |
    When root page of practice with name="Practice 1" is visited 
    When I click on a link containing the word edit
    Then I should see "Edit practice"
    And I should see textbox with id "practice_name" and value "Practice 1"

  @javascript
  Scenario: Edit the theory with a new description
    Given the following theories exist:
    | name      | description |
    | Theory 1  | Desc1       |
    When edit page of theory with name="Theory 1" is visited
    And I fill in theory description with "New Description"
    And I click on the "Update Theory" button
    Then I should see "New Description"

  Scenario: Edit the theory with empty data
    Given the following theories exist:
    | name      | description |
    | Theory 1  | Desc1       |
    When edit page of theory with name="Theory 1" is visited
    And I fill in name with ""
    And I click on the "Update Theory" button
    Then I should see "Name can't be blank"
 
  @javascript
  Scenario: Edit the assumption with a new description
    Given the following assumptions exist:
    | name      | description |
    | Assumption 1  | Desc1       |
    When edit page of assumption with name="Assumption 1" is visited
    And I fill in assumption description with "New Description"
    And I click on the "Update Assumption" button
    Then I should see "New Description"

  Scenario: Edit the assumption with empty data
    Given the following assumptions exist:
    | name      | description |
    | Assumption 1  | Desc1       |
    When edit page of assumption with name="Assumption 1" is visited
    And I fill in name with ""
    And I click on the "Update Assumption" button
    Then I should see "Name can't be blank"

  @javascript
  Scenario: Edit the practice with a new description
    Given the following practices exist:
    | name      | description |
    | Practice 1  | Desc1       |
    When edit page of practice with name="Practice 1" is visited
    And I fill in practice description with "New Description"
    And I click on the "Update Practice" button
    Then I should see "New Description"

  Scenario: Edit the practice with empty data
    Given the following practices exist:
    | name      | description |
    | Practice 1  | Desc1       |
    When edit page of practice with name="Practice 1" is visited
    And I fill in name with ""
    And I click on the "Update Practice" button
    Then I should see "Name can't be blank"
