
Feature: User profile page
  As a registered user
  I want to view my profile page
  So that I can see my personal information
  @selenium @auth
  Scenario: View user profile as login user
    When I visit my profile page as a registered user
    Then I should see my name
    And I should see my email address
  @selenium 
  Scenario: View user profile without login
    When I visit my profile page as a guest
    Then I should see a message telling me to log in
