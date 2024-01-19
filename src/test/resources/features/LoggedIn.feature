@test @jenkins
Feature: Logged In Journey

  Background:
    Given I start a journey
    Then I am on the do you want to sign in page

  Scenario: User chooses to log in to make payment
    When I select yes to sign in and click continue
    Then I am on the auth login page

  Scenario: User chooses to log in from reference page (cheque)
    When I select not signed in and click continue
    Then I am on the do you want a bank transfer page
    When I select no I want a cheque and click continue
    Then I am on the we need to confirm your identity for cheque page
    And The page lists just reference and NINO
    When I click to continue
    Then I am on the what is your reference page
    When I click the link Sign in using your Government Gateway user ID
    Then I am on the auth login page

  Scenario: User chooses to log in from reference page (bank transfer)

  Scenario: User chooses to log in after bank is not listed

  Scenario: User chooses to log in from the give permission page

  Scenario: User chooses to log in after bank transfer refund request is not submitted