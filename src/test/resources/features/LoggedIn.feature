@test @jenkins
Feature: Logged in journey

  Background:
    Given I start a journey
    Then I am on the do you want to sign in page

  Scenario: User chooses to log in to make payment
    When I select yes to sign in and click continue
    Then I am on the auth login page

  Scenario: User chooses to log in from reference page
    When I select not signed in and click continue
    Then I am on the what is your reference page
    When I click the link Sign in using your Government Gateway user ID
    Then I am on the auth login page