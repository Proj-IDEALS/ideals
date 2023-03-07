Feature: Entity page should contain all the entities of the same type in the database
    Users need to see a list of all entities in its corresponding page
    Scenario: Theories page should contain all theories in the database
        Given some theories exist
        When theories page is visited
        Then I should see a list of all theories

    Scenario: Assumptions page should contain all assumptions in the database
        Given some assumptions exist
        When assumptions page is visited
        Then I should see a list of all assumptions

    Scenario: Practices page should contain all practices in the database
        Given some practices exist
        When practices page is visited
        Then I should see a list of all practices
