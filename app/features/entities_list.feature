Feature: Entities page should contain all the entities of the same type in the database
    Users need to see a list of all entities in its corresponding page
  
    Scenario: Theories page should contain all theories in the database
        Given the following theories exist:
        | name      | description |
        | Theory 1  | Desc1       |
        | Theory 2  | Desc2       |
        | Theory 3  | Desc3       |

        When theories page is visited
        Then I should see "Theory 1"
        # Then I should see link to theories named "Theory 4"
        And I should see "Theory 2"
        And I should see "Theory 3"

    Scenario: Assumptions page should contain all assumptions in the database
        Given the following assumptions exist:
        | name          | description |
        | Assumption 1  | Desc1       |
        | Assumption 2  | Desc2       |
        | Assumption 3  | Desc3       |

        When assumptions page is visited
        Then I should see "Assumption 1"
        And I should see "Assumption 2"
        And I should see "Assumption 3"

    Scenario: Practices page should contain all practices in the database
        Given the following practices exist:
        | name        | description |
        | Practice 1  | Desc1       |
        | Practice 2  | Desc2       |
        | Practice 3  | Desc3       |

        When practices page is visited
        Then I should see "Practice 1"
        And I should see "Practice 2"
        And I should see "Practice 3"
