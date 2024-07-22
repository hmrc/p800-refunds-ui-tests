@test
Feature: Logged In Journey

  Background:
    Given I start a journey
    Then I am on the do you want to sign in page

  Scenario: User chooses to log in initially to make payment
    When I select yes to sign in and click continue
    Then I am on the auth login page

  Scenario: User doesn't know reference so chooses to log in (cheque)
    When I select not signed in and click continue
    Then I am on the do you want a bank transfer page
    When I select no I want a cheque and click continue
    Then I am on the we need to confirm your identity for cheque page
    And The page lists just reference and NINO
    When I click the link Sign in using your Government Gateway user ID
    Then I am on the auth login page
    And The redirect url contains /tax-you-paid/choose-year

  Scenario: User doesn't know reference so chooses to log in (bank transfer)
    When I select not signed in and click continue
    Then I am on the do you want a bank transfer page
    When I select yes, bank transfer and click continue
    Then I am on the we need to confirm your identity for bank transfer page
    And The page lists reference, NINO and DOB
    When I click the link Sign in using your Government Gateway user ID
    Then I am on the auth login page
    And The redirect url contains /tax-you-paid/choose-year

  Scenario: User checks for NINO (cheque)
    When I select not signed in and click continue
    Then I am on the do you want a bank transfer page
    When I select no I want a cheque and click continue
    Then I am on the we need to confirm your identity for cheque page
    And The page lists just reference and NINO
    When I click the link get help to find it
    Then I am on the lost national insurance number page in a new tab

  Scenario: User checks for NINO (bank transfer)
    When I select not signed in and click continue
    Then I am on the do you want a bank transfer page
    When I select yes, bank transfer and click continue
    Then I am on the we need to confirm your identity for bank transfer page
    And The page lists reference, NINO and DOB
    When I click the link get help to find it
    Then I am on the lost national insurance number page in a new tab