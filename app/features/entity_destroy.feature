Feature: destroy an entity
   As a user
   I want to destroy theories, assumptions, and practices
   So that I can make modifications to the database

  Scenario: Destroy a theory 
    Given the following theories exist:
    | name      | description |
    | Theory 1  | Desc1       |
    | Theory 2  | Desc2       |
    When root page of theory with name="Theory 1" is visited
    When I click on the "Destroy this theory" button
    Then I should see "Theories"
    And I should not see "Theory 1"
    And I should see "Theory 2"

  Scenario: Destroy a assumption 
    Given the following assumptions exist:
    | name      | description |
    | Assumption 1  | Desc1       |
    | Assumption 2  | Desc2       |
    When root page of assumption with name="Assumption 1" is visited
    When I click on the "Destroy this assumption" button
    Then I should see "Assumptions"
    And I should not see "Assumption 1"
    And I should see "Assumption 2"

  Scenario: Destroy a practice 
    Given the following practices exist:
    | name      | description |
    | Practice 1  | Desc1       |
    | Practice 2  | Desc2       |
    When root page of practice with name="Practice 1" is visited
    When I click on the "Destroy this practice" button
    Then I should see "Practices"
    And I should not see "Practice 1"
    And I should see "Practice 2"
