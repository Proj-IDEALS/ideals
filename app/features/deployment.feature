Feature: Deployment
    As an end user,
    So that I can use the application,
    I want to access the website

    Scenario: Website available at https://idealmaps.xyz/
        When I browse to https://idealmaps.xyz/
        Then I should get status code 200