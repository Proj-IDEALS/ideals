@selenium
Feature: Auth0 Logout

  Scenario: User logout
    Given I am on the main page
    When I click the logout button
    Then I should be returned to the main page