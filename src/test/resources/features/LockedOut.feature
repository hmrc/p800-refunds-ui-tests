@test
Feature: Locked Out

  Background:
    Given I start a journey
    Then I am on the do you want to sign in page
    When I select not signed in and click continue
    Then I am on the do you want a bank transfer page

  Scenario: Cheque user fails identity verification three times and clicks to log in
    When I select no I want a cheque and click continue
    Then I am on the we need to confirm your identity for cheque page
    And The page lists just reference and NINO
    When I click to continue
    Then I am on the what is your reference for cheque page
    When I enter 1234567890 in the reference input and click continue
    Then I am on the what is your national insurance number for cheque page
    When I enter AB099999C in the national insurance number input and click continue
    Then I am on the check answers for cheque page
    And The page has rows for just reference and NINO with NINO AB099999C
    When I click to continue
    Then I am on the we cannot confirm your identity for cheque page
    When I click to try again
    Then I am on the check answers for cheque page
    And The page has rows for just reference and NINO with NINO AB099999C
    When I click to continue
    Then I am on the we cannot confirm your identity for cheque page
    When I click to try again
    Then I am on the check answers for cheque page
    And The page has rows for just reference and NINO with NINO AB099999C
    When I click to continue
    Then I am on the locked out for cheque page
    When I click the link sign in to you HMRC online account
    Then I am on the auth login page
    And The redirect url contains /tax-you-paid/choose-year

  Scenario: Cheque user fails identity verification twice and then fails bank transfer verification once
    When I select no I want a cheque and click continue
    Then I am on the we need to confirm your identity for cheque page
    And The page lists just reference and NINO
    When I click to continue
    Then I am on the what is your reference for cheque page
    When I enter 1234567890 in the reference input and click continue
    Then I am on the what is your national insurance number for cheque page
    When I enter AB099999C in the national insurance number input and click continue
    Then I am on the check answers for cheque page
    And The page has rows for just reference and NINO with NINO AB099999C
    When I click to continue
    Then I am on the we cannot confirm your identity for cheque page
    When I click to try again
    Then I am on the check answers for cheque page
    And The page has rows for just reference and NINO with NINO AB099999C
    When I click to continue
    Then I am on the we cannot confirm your identity for cheque page
    When I click to choose another method
    Then I am on the choose another way to receive your refund from cheque page
    When I select not signed in and click continue
    Then I am on the we need to confirm your identity for bank transfer page
    And The page lists reference, NINO and DOB
    When I click to continue
    Then I am on the what is your reference for bank transfer page
    When I click to continue
    Then I am on the what is your national insurance number for bank transfer page
    When I click to continue
    Then I am on the what is your date of birth page
    When I enter 01 01 2000 in the date of birth input and click continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB with NINO AB099999C
    When I click to continue
    Then I am on the locked out for bank transfer page

  Scenario: Cheque user fails identity verification and then fails bank transfer verification twice
    When I select no I want a cheque and click continue
    Then I am on the we need to confirm your identity for cheque page
    And The page lists just reference and NINO
    When I click to continue
    Then I am on the what is your reference for cheque page
    When I enter 1234567890 in the reference input and click continue
    Then I am on the what is your national insurance number for cheque page
    When I enter AB099999C in the national insurance number input and click continue
    Then I am on the check answers for cheque page
    And The page has rows for just reference and NINO with NINO AB099999C
    When I click to continue
    Then I am on the we cannot confirm your identity for cheque page
    When I click to choose another method
    Then I am on the choose another way to receive your refund from cheque page
    When I select not signed in and click continue
    Then I am on the we need to confirm your identity for bank transfer page
    And The page lists reference, NINO and DOB
    When I click to continue
    Then I am on the what is your reference for bank transfer page
    When I click to continue
    Then I am on the what is your national insurance number for bank transfer page
    When I click to continue
    Then I am on the what is your date of birth page
    When I enter 01 01 2000 in the date of birth input and click continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB with NINO AB099999C
    When I click to continue
    Then I am on the we cannot confirm your identity for bank transfer page
    When I click to try again
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB with NINO AB099999C
    When I click to continue
    Then I am on the locked out for bank transfer page

  Scenario: Cheque user fails identity verification and then fails bank transfer verification and then cheque verification again
    When I select no I want a cheque and click continue
    Then I am on the we need to confirm your identity for cheque page
    And The page lists just reference and NINO
    When I click to continue
    Then I am on the what is your reference for cheque page
    When I enter 1234567890 in the reference input and click continue
    Then I am on the what is your national insurance number for cheque page
    When I enter AB099999C in the national insurance number input and click continue
    Then I am on the check answers for cheque page
    And The page has rows for just reference and NINO with NINO AB099999C
    When I click to continue
    Then I am on the we cannot confirm your identity for cheque page
    When I click to choose another method
    Then I am on the choose another way to receive your refund from cheque page
    When I select not signed in and click continue
    Then I am on the we need to confirm your identity for bank transfer page
    And The page lists reference, NINO and DOB
    When I click to continue
    Then I am on the what is your reference for bank transfer page
    When I click to continue
    Then I am on the what is your national insurance number for bank transfer page
    When I click to continue
    Then I am on the what is your date of birth page
    When I enter 01 01 2000 in the date of birth input and click continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB with NINO AB099999C
    When I click to continue
    Then I am on the we cannot confirm your identity for bank transfer page
    When I click to choose another method
    Then I am on the choose another way to receive your refund from bank transfer page
    When I select cheque and click continue
    Then I am on the we need to confirm your identity for cheque page
    And The page lists just reference and NINO
    When I click to continue
    Then I am on the what is your reference for cheque page
    When I click to continue
    Then I am on the what is your national insurance number for cheque page
    When I click to continue
    Then I am on the check answers for cheque page
    And The page has rows for just reference and NINO with NINO AB099999C
    When I click to continue
    Then I am on the locked out for cheque page

  Scenario: Bank transfer user fails identity verification three times and clicks to log in
    When I select yes, bank transfer and click continue
    Then I am on the we need to confirm your identity for bank transfer page
    And The page lists reference, NINO and DOB
    When I click to continue
    Then I am on the what is your reference for bank transfer page
    When I enter 1234567890 in the reference input and click continue
    Then I am on the what is your national insurance number for bank transfer page
    When I enter AB099999C in the national insurance number input and click continue
    Then I am on the what is your date of birth page
    When I enter 01 01 2000 in the date of birth input and click continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB with NINO AB099999C
    When I click to continue
    Then I am on the we cannot confirm your identity for bank transfer page
    When I click to try again
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB with NINO AB099999C
    When I click to continue
    Then I am on the we cannot confirm your identity for bank transfer page
    When I click to try again
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB with NINO AB099999C
    When I click to continue
    Then I am on the locked out for bank transfer page
    When I click the link sign in to you HMRC online account
    Then I am on the auth login page
    And The redirect url contains /tax-you-paid/choose-year

  Scenario: Bank transfer user fails identity verification twice and then fails cheque verification once
    When I select yes, bank transfer and click continue
    Then I am on the we need to confirm your identity for bank transfer page
    And The page lists reference, NINO and DOB
    When I click to continue
    Then I am on the what is your reference for bank transfer page
    When I enter 1234567890 in the reference input and click continue
    Then I am on the what is your national insurance number for bank transfer page
    When I enter AB099999C in the national insurance number input and click continue
    Then I am on the what is your date of birth page
    When I enter 01 01 2000 in the date of birth input and click continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB with NINO AB099999C
    When I click to continue
    Then I am on the we cannot confirm your identity for bank transfer page
    When I click to try again
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB with NINO AB099999C
    When I click to continue
    Then I am on the we cannot confirm your identity for bank transfer page
    When I click to choose another method
    Then I am on the choose another way to receive your refund from bank transfer page
    When I select cheque and click continue
    Then I am on the we need to confirm your identity for cheque page
    And The page lists just reference and NINO
    When I click to continue
    Then I am on the what is your reference for cheque page
    When I click to continue
    Then I am on the what is your national insurance number for cheque page
    When I click to continue
    Then I am on the check answers for cheque page
    And The page has rows for just reference and NINO with NINO AB099999C
    When I click to continue
    Then I am on the locked out for cheque page

  Scenario: Bank transfer user fails identity verification and then fails cheque verification twice
    When I select yes, bank transfer and click continue
    Then I am on the we need to confirm your identity for bank transfer page
    And The page lists reference, NINO and DOB
    When I click to continue
    Then I am on the what is your reference for bank transfer page
    When I enter 1234567890 in the reference input and click continue
    Then I am on the what is your national insurance number for bank transfer page
    When I enter AB099999C in the national insurance number input and click continue
    Then I am on the what is your date of birth page
    When I enter 01 01 2000 in the date of birth input and click continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB with NINO AB099999C
    When I click to continue
    Then I am on the we cannot confirm your identity for bank transfer page
    When I click to choose another method
    Then I am on the choose another way to receive your refund from bank transfer page
    When I select cheque and click continue
    Then I am on the we need to confirm your identity for cheque page
    And The page lists just reference and NINO
    When I click to continue
    Then I am on the what is your reference for cheque page
    When I click to continue
    Then I am on the what is your national insurance number for cheque page
    When I click to continue
    Then I am on the check answers for cheque page
    And The page has rows for just reference and NINO with NINO AB099999C
    When I click to continue
    Then I am on the we cannot confirm your identity for cheque page
    When I click to try again
    Then I am on the check answers for cheque page
    And The page has rows for just reference and NINO with NINO AB099999C
    When I click to continue
    Then I am on the locked out for cheque page

  Scenario: Bank transfer user fails identity verification and then fails cheque verification and then bank transfer verification again
    When I select yes, bank transfer and click continue
    Then I am on the we need to confirm your identity for bank transfer page
    And The page lists reference, NINO and DOB
    When I click to continue
    Then I am on the what is your reference for bank transfer page
    When I enter 1234567890 in the reference input and click continue
    Then I am on the what is your national insurance number for bank transfer page
    When I enter AB099999C in the national insurance number input and click continue
    Then I am on the what is your date of birth page
    When I enter 01 01 2000 in the date of birth input and click continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB with NINO AB099999C
    When I click to continue
    Then I am on the we cannot confirm your identity for bank transfer page
    When I click to choose another method
    Then I am on the choose another way to receive your refund from bank transfer page
    When I select cheque and click continue
    Then I am on the we need to confirm your identity for cheque page
    And The page lists just reference and NINO
    When I click to continue
    Then I am on the what is your reference for cheque page
    When I click to continue
    Then I am on the what is your national insurance number for cheque page
    When I click to continue
    Then I am on the check answers for cheque page
    And The page has rows for just reference and NINO with NINO AB099999C
    When I click to continue
    Then I am on the we cannot confirm your identity for cheque page
    When I click to choose another method
    Then I am on the choose another way to receive your refund from cheque page
    When I select not signed in and click continue
    Then I am on the we need to confirm your identity for bank transfer page
    And The page lists reference, NINO and DOB
    When I click to continue
    Then I am on the what is your reference for bank transfer page
    When I click to continue
    Then I am on the what is your national insurance number for bank transfer page
    When I click to continue
    Then I am on the what is your date of birth page
    When I click to continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB with NINO AB099999C
    When I click to continue
    Then I am on the locked out for bank transfer page

  #TODO: locked out returns to service