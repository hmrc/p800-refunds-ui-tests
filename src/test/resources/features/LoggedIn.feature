@test
Feature: Logged In Journey

  Background:
    Given I start a journey
    Then I am on the do you want to sign in page

  Scenario: User chooses to log in initially to make payment
    When I select yes to sign in and click continue
    Then I am on the auth login page

  Scenario: User chooses to log in from reference page (cheque)
    When I select not signed in and click continue
    Then I am on the do you want a bank transfer page
    When I select no I want a cheque and click continue
    Then I am on the we need to confirm your identity for cheque page
    And The page lists just reference and NINO
    When I click to continue
    Then I am on the what is your reference for cheque page
    When I click the link Sign in using your Government Gateway user ID
    Then I am on the auth login page
    And The redirect url contains /tax-you-paid/choose-year

  Scenario: User chooses to log in from reference page (bank transfer)
    When I select not signed in and click continue
    Then I am on the do you want a bank transfer page
    When I select yes, bank transfer and click continue
    Then I am on the we need to confirm your identity for bank transfer page
    And The page lists reference, NINO and DOB
    When I click to continue
    Then I am on the what is your reference for bank transfer page
    When I click the link Sign in using your Government Gateway user ID
    Then I am on the auth login page
    And The redirect url contains /tax-you-paid/choose-year

  Scenario: User chooses to log in after bank is not listed
    When I select not signed in and click continue
    Then I am on the do you want a bank transfer page
    When I select yes, bank transfer and click continue
    Then I am on the we need to confirm your identity for bank transfer page
    And The page lists reference, NINO and DOB
    When I click to continue
    Then I am on the what is your reference for bank transfer page
    When I enter 1234567890 in the reference input and click continue
    Then I am on the what is your national insurance number for bank transfer page
    When I enter AB999999C in the national insurance number input and click continue
    Then I am on the what is your date of birth page
    When I enter 01 01 2000 in the date of birth input and click continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB with NINO AB999999C
    When I click to continue
    Then I am on the we have confirmed your identity for bank transfer page
    When I click to continue
    Then I am on the what is the name of your bank page
    When I click the link my bank is not listed
    Then I am on the choose another way to receive your refund from bank transfer page
    When I select bank transfer using your Government Gateway user ID and click continue
    Then I am on the auth login page
    And The redirect url contains /tax-you-paid/choose-year

  Scenario: User chooses to log in from the give permission page
    When I select not signed in and click continue
    Then I am on the do you want a bank transfer page
    When I select yes, bank transfer and click continue
    Then I am on the we need to confirm your identity for bank transfer page
    And The page lists reference, NINO and DOB
    When I click to continue
    Then I am on the what is your reference for bank transfer page
    When I enter 1234567890 in the reference input and click continue
    Then I am on the what is your national insurance number for bank transfer page
    When I enter AB999999C in the national insurance number input and click continue
    Then I am on the what is your date of birth page
    When I enter 01 01 2000 in the date of birth input and click continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB with NINO AB999999C
    When I click to continue
    Then I am on the we have confirmed your identity for bank transfer page
    When I click to continue
    Then I am on the what is the name of your bank page
    When I enter Chase in the bank input and click continue
    Then I am on the give your permission page
    And The first paragraph contains Chase
    When I click the link choose another way to get my money
    Then I am on the choose another way to receive your refund from bank transfer page
    When I select bank transfer using your Government Gateway user ID and click continue
    Then I am on the auth login page
    And The redirect url contains /tax-you-paid/choose-year

  Scenario: User chooses to log in after bank transfer refund request is not submitted
    When I select not signed in and click continue
    Then I am on the do you want a bank transfer page
    When I select yes, bank transfer and click continue
    Then I am on the we need to confirm your identity for bank transfer page
    And The page lists reference, NINO and DOB
    When I click to continue
    Then I am on the what is your reference for bank transfer page
    When I enter 1234567890 in the reference input and click continue
    Then I am on the what is your national insurance number for bank transfer page
    When I enter AB999999C in the national insurance number input and click continue
    Then I am on the what is your date of birth page
    When I enter 01 01 2000 in the date of birth input and click continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB with NINO AB999999C
    When I click to continue
    Then I am on the we have confirmed your identity for bank transfer page
    When I click to continue
    Then I am on the what is the name of your bank page
    When I enter Chase in the bank input and click continue
    Then I am on the give your permission page
    And The first paragraph contains Chase
    Then I am on the give your permission page
    And The first paragraph contains Chase
    When I click to approve the refund
    Then I am on the bank stub page
    When I select Failed and click continue
    Then I am on the verifying account page
    When I click the link refresh this page
    Then I am on the verifying account page
    When I navigate to test-only and select request failed
    Then I am on the refund request not submitted page
    When I click to choose another way to get my money
    Then I am on the choose another way to receive your refund from bank transfer page
    When I select bank transfer using your Government Gateway user ID and click continue
    Then I am on the auth login page
    And The redirect url contains /tax-you-paid/choose-year