Feature: Map view

  As a user
  I want to see the concept map
  So that I can visualize the relationships between assumptions, theories, and practices

  Background:
    Given I have created assumptions, theories, practices and their associations

  Scenario: View the concept map
    When I visit the map page
    Then I should see the IDEALS logo
    And I should see the search icon
    And I should see an iframe
    And I should see the concept-map container

  Scenario: The concept map receives the correct data
    When I request the concept map data
    Then the JSON response should contain the correct nodes and edges
