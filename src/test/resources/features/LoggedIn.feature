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
    When I click the link Sign in or create a personal tax account
    Then I am on the auth login page

  Scenario: User chooses to visit income tax helpline
    When I select not signed in and click continue
    Then I am on the what is your reference page
    When I click the link Call the income tax helpline
    Then I am on the income tax page in a new tab