@test
Feature: Bank Transfer Journey (Unhappy Paths - Identity Checks)

  Background:
    Given I start a journey
    Then I am on the do you want to sign in page
    When I select not signed in and click continue
    Then I am on the do you want a bank transfer page
    When I select yes, bank transfer and click continue
    Then I am on the we need to confirm your identity for bank transfer page
    And The page lists reference, NINO and DOB
    When I click to continue
    Then I am on the what is your reference for bank transfer page

  Scenario: User fails to verify identity in reference check so claims a cheque
    When I enter 1234567890 in the reference input and click continue
    Then I am on the what is your national insurance number for bank transfer page
    When I enter AB099999C in the national insurance number input and click continue
    Then I am on the what is your date of birth page
    When I enter 01 01 2000 in the date of birth input and click continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB with NINO AB099999C
    When I click to continue
    Then I am on the we cannot confirm your identity for bank transfer page
    When I click to choose another way to get my refund
    Then I am on the choose another way to receive your refund from bank transfer page
    When I select cheque and click continue
    Then I am on the we need to confirm your identity for cheque page
    And The page lists just reference and NINO
    When I click to continue
    Then I am on the what is your reference for cheque page
    When I click to continue
    Then I am on the what is your national insurance number for cheque page
    When I change the national insurance number input to AB999999C and click continue
    Then I am on the check answers for cheque page
    And The page has rows for just reference and NINO with NINO AB999999C
    When I click to continue
    Then I am on the we have confirmed your identity for cheque page
    When I click to continue
    Then I am on the is your address up to date page
    When I select yes for address and click continue
    Then I am on the cheque request received page
    And The page contains 1234567890

  Scenario: User submits reference which is too large and then logs in
    When I enter 9999999999 in the reference input and click continue
    Then I am on the what is your national insurance number for bank transfer page
    When I enter AB999999C in the national insurance number input and click continue
    Then I am on the what is your date of birth page
    When I enter 01 01 2000 in the date of birth input and click continue
    Then I am on the check answers for bank transfer page
    When I click to continue
    Then I am on the we cannot confirm your identity for bank transfer page
    And A failed attempt Is logged in Mongo
    When I click to choose another way to get my refund
    Then I am on the choose another way to receive your refund from bank transfer page
    When I select bank transfer using your Government Gateway user ID and click continue
    Then I am on the auth login page
    And The redirect url contains /tax-you-paid/choose-year

  Scenario: User has already claimed refund and fails reference check
    When I enter 1234567890 in the reference input and click continue
    Then I am on the what is your national insurance number for bank transfer page
    When I enter AB199999C in the national insurance number input and click continue
    Then I am on the what is your date of birth page
    When I enter 01 01 2000 in the date of birth input and click continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB with NINO AB199999C
    When I click to continue
    Then I am on the there is a problem page
    And A failed attempt Isn't logged in Mongo
    When I click browser back
    Then I am on the there is a problem page
    When I click the link contact us
    Then I am on the income tax enquiries page

  Scenario Outline: Reference Check API fails
    When I enter 1234567890 in the reference input and click continue
    Then I am on the what is your national insurance number for bank transfer page
    When I enter <NINO> in the national insurance number input and click continue
    Then I am on the what is your date of birth page
    When I enter 01 01 2000 in the date of birth input and click continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB with NINO <NINO>
    When I click to continue
    Then I am on the <Page> page
    And A failed attempt <Failed attempt> logged in Mongo
    Examples:
      | NINO      | Page                                              | Failed attempt | Response |
      | AB099999C | we cannot confirm your identity for bank transfer | Is             | 404      |
      | AB299999C | there is a problem                                | Isn't          | 422      |
      | AB399999C | technical difficulties                            | Isn't          | 400      |
      | AB499999C | technical difficulties                            | Isn't          | 403      |
      | AB599999C | technical difficulties                            | Isn't          | 500      |

  Scenario Outline: Trace Individual API fails
    When I enter 1234567890 in the reference input and click continue
    Then I am on the what is your national insurance number for bank transfer page
    When I enter <NINO> in the national insurance number input and click continue
    Then I am on the what is your date of birth page
    When I enter 01 01 2000 in the date of birth input and click continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB with NINO <NINO>
    When I click to continue
    Then I am on the <Page> page
    And A failed attempt <Failed attempt> logged in Mongo
    Examples:
      | NINO      | Page                                              | Failed attempt | Response |
      | AB699999C | we cannot confirm your identity for bank transfer | Is             | 404      |
      | AB799999C | technical difficulties                            | Isn't          | 400      |
      | AB899999C | technical difficulties                            | Isn't          | 500      |