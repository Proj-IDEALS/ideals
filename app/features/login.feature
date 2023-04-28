@javascript
Feature: Auth0 Login

  Scenario: User logs in with valid credentials
    Given I am on the login page
    When I enter valid credentials
    Then I should be redirected to the main page