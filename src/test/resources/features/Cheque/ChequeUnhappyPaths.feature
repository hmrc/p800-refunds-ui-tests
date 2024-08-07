@test
Feature: Cheque Journey (Unhappy Paths)

  Background:
    Given I start a journey
    Then I am on the do you want to sign in page
    When I select not signed in and click continue
    Then I am on the do you want a bank transfer page
    When I select no I want a cheque and click continue
    Then I am on the we need to confirm your identity for cheque page
    And The page lists just reference and NINO
    When I click to continue
    Then I am on the what is your reference for cheque page

  Scenario: User fails to verify identity in reference check so claims a bank transfer
    When I enter 1234567890 in the reference input and click continue
    Then I am on the what is your national insurance number for cheque page
    When I enter AB099999C in the national insurance number input and click continue
    Then I am on the check answers for cheque page
    And The page has rows for just reference and NINO with NINO AB099999C
    When I click to continue
    Then I am on the we cannot confirm your identity for cheque page
    When I click to claim your refund by bank transfer
    Then I am on the choose another way to receive your refund from cheque page
    When I select not signed in and click continue
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
    Then I am on the give your consent page
    And The first paragraph contains Chase
    When I click to approve the refund
    Then I am on the bank stub page
    When I select Authorised and click continue
    Then I am on the verifying account page
    When I receive a valid response
    Then I am on the bank transfer request received page
    And The page contains 1234567890

  Scenario: User submits reference which is too large and then logs in
    When I enter 9999999999 in the reference input and click continue
    Then I am on the what is your national insurance number for cheque page
    When I enter AB999999C in the national insurance number input and click continue
    Then I am on the check answers for cheque page
    When I click to continue
    Then I am on the we cannot confirm your identity for cheque page
    And A failed attempt Is logged in Mongo
    When I click to claim your refund by bank transfer
    Then I am on the choose another way to receive your refund from cheque page
    When I select yes to sign in and click continue
    Then I am on the auth login page
    And The redirect url contains /tax-you-paid/choose-year

  Scenario: User has already claimed refund and fails reference check
    When I enter 1234567890 in the reference input and click continue
    Then I am on the what is your national insurance number for cheque page
    When I enter AB199999C in the national insurance number input and click continue
    Then I am on the check answers for cheque page
    And The page has rows for just reference and NINO with NINO AB199999C
    When I click to continue
    Then I am on the there is a problem page
    And A failed attempt Isn't logged in Mongo
    When I click browser back
    Then I am on the there is a problem page
    When I click the link contact us
    Then I am on the income tax enquiries page

  Scenario Outline: Reference Check API fails
    When I enter 1234567890 in the reference input and click continue
    Then I am on the what is your national insurance number for cheque page
    When I enter <NINO> in the national insurance number input and click continue
    Then I am on the check answers for cheque page
    And The page has rows for just reference and NINO with NINO <NINO>
    When I click to continue
    Then I am on the <Page> page
    And A failed attempt <Failed attempt> logged in Mongo
    Examples:
      | NINO      | Page                                       | Failed attempt | Response |
      | AB099999C | we cannot confirm your identity for cheque | Is             | 404      |
      | AB299999C | there is a problem                         | Isn't          | 422      |
      | AB399999C | technical difficulties                     | Isn't          | 400      |
      | AB499999C | technical difficulties                     | Isn't          | 403      |
      | AB599999C | technical difficulties                     | Isn't          | 500      |

  Scenario: Issue Payable Order API fails
    When I enter 1234567890 in the reference input and click continue
    Then I am on the what is your national insurance number for cheque page
    When I enter AB979999C in the national insurance number input and click continue
    Then I am on the check answers for cheque page
    And The page has rows for just reference and NINO with NINO AB979999C
    When I click to continue
    Then I am on the we have confirmed your identity for cheque page
    When I click to continue
    Then I am on the is your address up to date page
    When I select yes for address and click continue
    Then I am on the technical difficulties page

  Scenario: Payable order API returns 422
    When I enter 1234567890 in the reference input and click continue
    Then I am on the what is your national insurance number for cheque page
    When I enter AB909999C in the national insurance number input and click continue
    Then I am on the check answers for cheque page
    And The page has rows for just reference and NINO with NINO AB909999C
    When I click to continue
    Then I am on the we have confirmed your identity for cheque page
    When I click to continue
    Then I am on the is your address up to date page
    When I select yes for address and click continue
    Then I am on the there is a problem page
    When I click the link contact us
    Then I am on the income tax enquiries page