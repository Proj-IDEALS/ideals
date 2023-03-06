Feature: Does the starting point contain all the links?
    Users need to start with theories or assumptions or practices

    Scenario: There is a link to theories
        Given starting-point page is visited
        When I click on a link containing the word theories
        Then I should see theories list page

    Scenario: There is a link to assumptions
        Given starting-point page is visited
        When I click on a link containing the word assumptions
        Then I should see assumptions list page
        
    Scenario: There is a link to theories
        Given starting-point page is visited
        When I click on a link containing the word practices
        Then I should see practices list page
    
