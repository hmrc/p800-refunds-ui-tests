@test
Feature: Bank Transfer Journey (Unhappy Paths - Ecospend)

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
    When I enter AB999999C in the national insurance number input and click continue
    Then I am on the what is your date of birth page
    When I enter 01 01 2000 in the date of birth input and click continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB with NINO AB999999C
    When I click to continue
    Then I am on the we have confirmed your identity for bank transfer page
    When I click to continue
    Then I am on the what is the name of your bank page

  Scenario Outline: Ecospend Consent API fails
    When I enter Test | <error bank> in the bank input and click continue
    Then I am on the give your consent page
    And The first paragraph contains Test | <error bank>
    When I click to approve the refund
    Then I am on the technical difficulties page
    Examples:
      | error bank                |
      | Bad Request               |
      | Unauthorized 401          |
      | Internal Server Error 500 |
      | Bad Gateway 502           |
      | Service Unavailable 503   |

  Scenario: User returns to service from Ecospend with failed status
    When I enter Chase in the bank input and click continue
    Then I am on the give your consent page
    And The first paragraph contains Chase
    When I click to approve the refund
    Then I am on the bank stub page
    When I select Failed and click continue
    When I receive a valid response
    Then I am on the refund request not submitted page

  Scenario: User returns to service from Ecospend in a new browser with failed status and tries to change payment type
    When I enter Monzo Business in the bank input and click continue
    Then I am on the give your consent page
    And The first paragraph contains Monzo Business
    When I click to approve the refund
    Then I am on the bank stub page
    When I return to the service in a new window with status Failed
    Then I am on the refund request not submitted page
    And I am flagged in Mongo as a returning user
    When I click to choose another way to get my refund via button
    Then I am on the do you want to sign in page

  Scenario Outline: User returns to service from Ecospend with cancelled status
    When I enter Chase in the bank input and click continue
    Then I am on the give your consent page
    And The first paragraph contains Chase
    When I click to approve the refund
    Then I am on the bank stub page
    When I select Canceled and click continue
    When I receive a valid response
    Then I am on the refund cancelled page
    When I click to <link>
    Then I am on the <page> page
    Examples:
      | link               | page                                                         |
      | try again          | what is the name of your bank                                |
      | choose another way | choose another way to receive your refund from bank transfer |

  Scenario: User returns to service from Ecospend in a new browser with cancelled status and tries to change bank
    When I enter Monzo Business in the bank input and click continue
    Then I am on the give your consent page
    And The first paragraph contains Monzo Business
    When I click to approve the refund
    Then I am on the bank stub page
    When I return to the service in a new window with status Canceled
    Then I am on the refund cancelled page
    And I am flagged in Mongo as a returning user
    When I click to try again
    Then I am on the do you want to sign in page

  Scenario Outline: Bank Account Summary doesn't return account information
    When I enter Test | Account Summary | <Bank> in the bank input and click continue
    Then I am on the give your consent page
    And The first paragraph contains Test | Account Summary | <Bank>
    When I click to approve the refund
    Then I am on the bank stub page
    When I select Authorised and click continue
    Then I am on the refund request not submitted page
    Examples:
      | Bank                               |
      | Account Identification set to None |
      | All optional fields set to None    |

  Scenario: User fails ecospend check so applies for cheque instead
    When I enter Chase in the bank input and click continue
    Then I am on the give your consent page
    And The first paragraph contains Chase
    Then I am on the give your consent page
    And The first paragraph contains Chase
    When I click to approve the refund
    Then I am on the bank stub page
    When I select Authorised and click continue
    Then I am on the verifying account page
    When I receive a not valid response
    Then I am on the refund request not submitted page
    When I click to choose another way to get my refund via button
    Then I am on the choose another way to receive your refund from bank transfer page
    When I select cheque and click continue
    Then I am on the is your address up to date page
    When I select yes for address and click continue
    Then I am on the cheque request received page
    And The page contains 1234567890

  Scenario: User fails ecospend check so logs in instead
    When I enter Chase in the bank input and click continue
    Then I am on the give your consent page
    And The first paragraph contains Chase
    Then I am on the give your consent page
    And The first paragraph contains Chase
    When I click to approve the refund
    Then I am on the bank stub page
    When I select Authorised and click continue
    Then I am on the verifying account page
    When I receive a not valid response
    Then I am on the refund request not submitted page
    When I click to choose another way to get my refund via button
    Then I am on the choose another way to receive your refund from bank transfer page
    When I select bank transfer using your Government Gateway user ID and click continue
    Then I am on the auth login page
    And The redirect url contains /tax-you-paid/choose-year

  Scenario: User fails ecospend check and they click back
    When I enter Chase in the bank input and click continue
    Then I am on the give your consent page
    And The first paragraph contains Chase
    Then I am on the give your consent page
    And The first paragraph contains Chase
    When I click to approve the refund
    Then I am on the bank stub page
    When I select Authorised and click continue
    Then I am on the verifying account page
    When I receive a not valid response
    Then I am on the refund request not submitted page
    When I click browser back
    Then I am on the bank stub page
    When I click browser back
    Then I am on the refund request not submitted page

  Scenario: User stays on verifying page after ecospend sends no response
    When I enter Chase in the bank input and click continue
    Then I am on the give your consent page
    And The first paragraph contains Chase
    Then I am on the give your consent page
    And The first paragraph contains Chase
    When I click to approve the refund
    Then I am on the bank stub page
    When I select Authorised and click continue
    Then I am on the verifying account page
    When I receive a not received response
    Then I am on the refund request not submitted try again page