@test
Feature: Bank Transfer Journey (Unhappy Paths - Verifying Page)

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
    When I enter 1234567890 in the reference input and click continue
    Then I am on the what is your national insurance number for bank transfer page

  Scenario: User fails name-matching
    When I enter NN999999C in the national insurance number input and click continue
    Then I am on the what is your date of birth page
    When I enter 01 01 2000 in the date of birth input and click continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB with NINO NN999999C
    When I click to continue
    Then I am on the we have confirmed your identity for bank transfer page
    When I click to continue
    Then I am on the what is the name of your bank page
    When I enter Chase in the bank input and click continue
    Then I am on the give your consent page
    And The first paragraph contains Chase
    When I click to approve the refund
    Then I am on the bank stub page
    When I select Authorised and Valid and click continue
    Then I am on the verifying account page
#    When I receive a valid response
    Then I am on the refund request not submitted page

  Scenario: Individual Trace doesn't return surname & other optional fields so name-matching fails
    When I enter AB991999C in the national insurance number input and click continue
    Then I am on the what is your date of birth page
    When I enter 01 01 2000 in the date of birth input and click continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB with NINO AB991999C
    When I click to continue
    Then I am on the we have confirmed your identity for bank transfer page
    When I click to continue
    Then I am on the what is the name of your bank page
    When I enter Chase in the bank input and click continue
    Then I am on the give your consent page
    And The first paragraph contains Chase
    When I click to approve the refund
    Then I am on the bank stub page
    When I select Authorised and Valid and click continue
    Then I am on the verifying account page
#    When I receive a valid response
    Then I am on the refund request not submitted page

  Scenario: User fails EDH risk check
    When I enter AB919999C in the national insurance number input and click continue
    Then I am on the what is your date of birth page
    When I enter 01 01 2000 in the date of birth input and click continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB with NINO AB919999C
    When I click to continue
    Then I am on the we have confirmed your identity for bank transfer page
    When I click to continue
    Then I am on the what is the name of your bank page
    When I enter Chase in the bank input and click continue
    Then I am on the give your consent page
    And The first paragraph contains Chase
    When I click to approve the refund
    Then I am on the bank stub page
    When I select Authorised and Valid and click continue
    Then I am on the verifying account page
#    When I receive a valid response
    Then I am on the bank transfer request received page

  Scenario: User fails EDH risk check without Reference Check optional fields
    When I enter AB910999C in the national insurance number input and click continue
    Then I am on the what is your date of birth page
    When I enter 01 01 2000 in the date of birth input and click continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB with NINO AB910999C
    When I click to continue
    Then I am on the we have confirmed your identity for bank transfer page
    When I click to continue
    Then I am on the what is the name of your bank page
    When I enter Chase in the bank input and click continue
    Then I am on the give your consent page
    And The first paragraph contains Chase
    When I click to approve the refund
    Then I am on the bank stub page
    When I select Authorised and Valid and click continue
    Then I am on the verifying account page
#    When I receive a valid response
    Then I am on the bank transfer request received page

  Scenario Outline: EDH risk check API fails with 4xx
    When I enter <NINO> in the national insurance number input and click continue
    Then I am on the what is your date of birth page
    When I enter 01 01 2000 in the date of birth input and click continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB with NINO <NINO>
    When I click to continue
    Then I am on the we have confirmed your identity for bank transfer page
    When I click to continue
    Then I am on the what is the name of your bank page
    When I enter Chase in the bank input and click continue
    Then I am on the give your consent page
    And The first paragraph contains Chase
    When I click to approve the refund
    Then I am on the bank stub page
    When I select Authorised and Valid and click continue
    Then I am on the verifying account page
#    When I receive a valid response
    Then I am on the technical difficulties page
    Examples:
      | NINO      | Response |
      | AB929999C | 400      |
      | AB939999C | 403      |
      | AB949999C | 404      |

  Scenario Outline: EDH risk check API fails with 5xx
    When I enter <NINO> in the national insurance number input and click continue
    Then I am on the what is your date of birth page
    When I enter 01 01 2000 in the date of birth input and click continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB with NINO <NINO>
    When I click to continue
    Then I am on the we have confirmed your identity for bank transfer page
    When I click to continue
    Then I am on the what is the name of your bank page
    When I enter Chase in the bank input and click continue
    Then I am on the give your consent page
    And The first paragraph contains Chase
    When I click to approve the refund
    Then I am on the bank stub page
    When I select Authorised and Valid and click continue
    Then I am on the verifying account page
#    When I receive a valid response
    Then I am on the refund request not submitted try again page
    Examples:
      | NINO      | Response |
      | AB959999C | 500      |
      | AB969999C | 503      |

  Scenario Outline: EDH fails with 500 and user clicks link on try again page
    When I enter AB959999C in the national insurance number input and click continue
    Then I am on the what is your date of birth page
    When I enter 01 01 2000 in the date of birth input and click continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB with NINO AB959999C
    When I click to continue
    Then I am on the we have confirmed your identity for bank transfer page
    When I click to continue
    Then I am on the what is the name of your bank page
    When I enter Chase in the bank input and click continue
    Then I am on the give your consent page
    And The first paragraph contains Chase
    When I click to approve the refund
    Then I am on the bank stub page
    When I select Authorised and Valid and click continue
    Then I am on the verifying account page
#    When I receive a valid response
    Then I am on the refund request not submitted try again page
    When I click to <link>
    Then I am on the <page> page
    Examples:
      | link               | page                                                         |
      | try again          | refund request not submitted try again                       |
      | choose another way | choose another way to receive your refund from bank transfer |
      | return to guidance | guidance                                                     |

  Scenario Outline: Claim overpayment API fails
    When I enter <NINO> in the national insurance number input and click continue
    Then I am on the what is your date of birth page
    When I enter 01 01 2000 in the date of birth input and click continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB with NINO <NINO>
    When I click to continue
    Then I am on the we have confirmed your identity for bank transfer page
    When I click to continue
    Then I am on the what is the name of your bank page
    When I enter Chase in the bank input and click continue
    Then I am on the give your consent page
    And The first paragraph contains Chase
    When I click to approve the refund
    Then I am on the bank stub page
    When I select Authorised and Valid and click continue
    Then I am on the verifying account page
#    When I receive a valid response
    Then I am on the refund request not submitted try again page
    Examples:
      | NINO      | Response                 |
      | AB999991C | 400                      |
      | AB999992C | 403                      |
      | AB999993C | 500                      |
      | AB999995C | 422 - unexpected message |

  Scenario: Claim Overpayment API returns 422
    When I enter AB999994C in the national insurance number input and click continue
    Then I am on the what is your date of birth page
    When I enter 01 01 2000 in the date of birth input and click continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB with NINO AB999994C
    When I click to continue
    Then I am on the we have confirmed your identity for bank transfer page
    When I click to continue
    Then I am on the what is the name of your bank page
    When I enter Chase in the bank input and click continue
    Then I am on the give your consent page
    And The first paragraph contains Chase
    When I click to approve the refund
    Then I am on the bank stub page
    When I select Authorised and Valid and click continue
    Then I am on the verifying account page
#    When I receive a valid response
    Then I am on the there is a problem page
    When I click the link contact us
    Then I am on the income tax enquiries page

  Scenario Outline: Case Management API fails
    When I enter <NINO> in the national insurance number input and click continue
    Then I am on the what is your date of birth page
    When I enter 01 01 2000 in the date of birth input and click continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB with NINO <NINO>
    When I click to continue
    Then I am on the we have confirmed your identity for bank transfer page
    When I click to continue
    Then I am on the what is the name of your bank page
    When I enter Chase in the bank input and click continue
    Then I am on the give your consent page
    And The first paragraph contains Chase
    When I click to approve the refund
    Then I am on the bank stub page
    When I select Authorised and Valid and click continue
    Then I am on the verifying account page
#    When I receive a valid response
    Then I am on the technical difficulties page
    Examples:
      | NINO      | Response |
      | AB919919C | 400      |
      | AB919929C | 403      |
      | AB919939C | 500      |

  Scenario: Suspend overpayment API fails
    When I enter AB919099C in the national insurance number input and click continue
    Then I am on the what is your date of birth page
    When I enter 01 01 2000 in the date of birth input and click continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB with NINO AB919099C
    When I click to continue
    Then I am on the we have confirmed your identity for bank transfer page
    When I click to continue
    Then I am on the what is the name of your bank page
    When I enter Chase in the bank input and click continue
    Then I am on the give your consent page
    And The first paragraph contains Chase
    When I click to approve the refund
    Then I am on the bank stub page
    When I select Authorised and Valid and click continue
    Then I am on the verifying account page
#    When I receive a valid response
    Then I am on the technical difficulties page
