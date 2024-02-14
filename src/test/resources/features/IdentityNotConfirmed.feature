@test
Feature: Identity Verification Fails

  Background:
    Given I start a journey
    Then I am on the do you want to sign in page
    When I select not signed in and click continue
    Then I am on the do you want a bank transfer page

  Scenario: Cheque user fails identity verification and completes a bank transfer
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
    When I select bank transfer logged out and click continue
    Then I am on the we need to confirm your identity for bank transfer page
    And The page lists reference, NINO and DOB
    When I click to continue
    Then I am on the what is your reference for bank transfer page
    When I click to continue
    Then I am on the what is your national insurance number for bank transfer page
    When I change the national insurance number input to AB999999C and click continue
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
    When I click to approve the refund
    Then I am on the bank stub page
    When I select Authorised and click continue
    Then I am on the verifying account page
    When I click the link refresh this page
    Then I am on the verifying account page
    When I navigate to test-only and select request success
    Then I am on the bank transfer request received page
    And The page contains 1234567890

  Scenario: Cheque user fails identity verification and logs in
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
    When I select bank transfer using your Government Gateway user ID and click continue
    Then I am on the auth login page
    And The redirect url contains /tax-you-paid/choose-year

  Scenario: Bank transfer user fails identity verification and completes a cheque journey
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
    When I change the national insurance number input to AB999999C and click continue
    Then I am on the check answers for cheque page
    And The page has rows for just reference and NINO with NINO AB999999C
    When I click to continue
    Then I am on the we have confirmed your identity for cheque page
    When I click to continue
    Then I am on the complete your refund request page
    When I click to submit refund request
    Then I am on the cheque request received page
    And The page contains 1234567890

  Scenario: Bank transfer user fails identity verification and logs in
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
    When I select bank transfer using your Government Gateway user ID and click continue
    Then I am on the auth login page
    And The redirect url contains /tax-you-paid/choose-year

  Scenario Outline: Reference Check API fails (cheque)
    When I select no I want a cheque and click continue
    Then I am on the we need to confirm your identity for cheque page
    And The page lists just reference and NINO
    When I click to continue
    Then I am on the what is your reference for cheque page
    When I enter 1234567890 in the reference input and click continue
    Then I am on the what is your national insurance number for cheque page
    When I enter <NINO> in the national insurance number input and click continue
    Then I am on the check answers for cheque page
    And The page has rows for just reference and NINO with NINO <NINO>
    When I click to continue
    Then I am on the <Page> page
    And A failed attempt <Failed attempt> logged in Mongo
    Examples:
      | NINO      | Page                                       | Failed attempt | Response                    |
      | AB099999C | we cannot confirm your identity for cheque | Is             | 404                         |
      | AB199999C | we cannot confirm your identity for cheque | Isn't          | 422 - refund already taken  |
      | AB299999C | technical difficulties                     | Isn't          | 422 - unprocessable entity  |
      | AB399999C | technical difficulties                     | Isn't          | 400                         |
      | AB499999C | technical difficulties                     | Isn't          | 403                         |
      | AB599999C | technical difficulties                     | Isn't          | 500                         |

  Scenario Outline: Reference Check API fails (bank transfer)
    When I select yes, bank transfer and click continue
    Then I am on the we need to confirm your identity for bank transfer page
    And The page lists reference, NINO and DOB
    When I click to continue
    Then I am on the what is your reference for bank transfer page
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
      | NINO      | Page                                              | Failed attempt | Response                    |
      | AB099999C | we cannot confirm your identity for bank transfer | Is             | 404                         |
      | AB199999C | we cannot confirm your identity for bank transfer | Isn't          | 422 - refund already taken  |
      | AB299999C | technical difficulties                            | Isn't          | 422 - unprocessable entity  |
      | AB399999C | technical difficulties                            | Isn't          | 400                         |
      | AB499999C | technical difficulties                            | Isn't          | 403                         |
      | AB599999C | technical difficulties                            | Isn't          | 500                         |