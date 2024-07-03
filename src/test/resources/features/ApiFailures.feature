@test
Feature: API Failures

  Background:
    Given I start a journey
    Then I am on the do you want to sign in page
    When I select not signed in and click continue
    Then I am on the do you want a bank transfer page

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
      | NINO      | Page                                       | Failed attempt | Response |
      | AB099999C | we cannot confirm your identity for cheque | Is             | 404      |
      | AB299999C | there is a problem                         | Isn't          | 422      |
      | AB399999C | technical difficulties                     | Isn't          | 400      |
      | AB499999C | technical difficulties                     | Isn't          | 403      |
      | AB599999C | technical difficulties                     | Isn't          | 500      |

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
      | NINO      | Page                                              | Failed attempt | Response |
      | AB099999C | we cannot confirm your identity for bank transfer | Is             | 404      |
      | AB299999C | there is a problem                                | Isn't          | 422      |
      | AB399999C | technical difficulties                            | Isn't          | 400      |
      | AB499999C | technical difficulties                            | Isn't          | 403      |
      | AB599999C | technical difficulties                            | Isn't          | 500      |

  Scenario Outline: Trace Individual API fails
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
      | NINO      | Page                                              | Failed attempt | Response |
      | AB699999C | we cannot confirm your identity for bank transfer | Is             | 404      |
      | AB799999C | technical difficulties                            | Isn't          | 400      |
      | AB899999C | technical difficulties                            | Isn't          | 500      |

  Scenario: Issue Payable Order API fails
    When I select no I want a cheque and click continue
    Then I am on the we need to confirm your identity for cheque page
    And The page lists just reference and NINO
    When I click to continue
    Then I am on the what is your reference for cheque page
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

  Scenario Outline: Ecospend Consent API fails
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

  Scenario Outline: EDH risk check API fails with 4xx
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
    Then I am on the we have confirmed your identity for bank transfer page
    When I click to continue
    Then I am on the what is the name of your bank page
    When I enter Chase in the bank input and click continue
    Then I am on the give your consent page
    And The first paragraph contains Chase
    When I click to approve the refund
    Then I am on the bank stub page
    When I select Authorised and click continue
    Then I am on the technical difficulties page
    Examples:
      | NINO      | Response |
      | AB929999C | 400      |
      | AB939999C | 403      |
      | AB949999C | 404      |

  Scenario Outline: EDH risk check API fails with 5xx
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
    Then I am on the we have confirmed your identity for bank transfer page
    When I click to continue
    Then I am on the what is the name of your bank page
    When I enter Chase in the bank input and click continue
    Then I am on the give your consent page
    And The first paragraph contains Chase
    When I click to approve the refund
    Then I am on the bank stub page
    When I select Authorised and click continue
    Then I am on the refund request not submitted try again page
    Examples:
      | NINO      | Response |
      | AB959999C | 500      |
      | AB969999C | 503      |

  Scenario Outline: Claim overpayment API fails
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
    Then I am on the refund request not submitted try again page
    Examples:
      | NINO      | Response                   |
      | AB999991C | 400                        |
      | AB999992C | 403                        |
      | AB999993C | 500                        |
      | AB999995C | 422 - unprocessable entity |

  Scenario: Suspend overpayment API fails
    When I select yes, bank transfer and click continue
    Then I am on the we need to confirm your identity for bank transfer page
    And The page lists reference, NINO and DOB
    When I click to continue
    Then I am on the what is your reference for bank transfer page
    When I enter 1234567890 in the reference input and click continue
    Then I am on the what is your national insurance number for bank transfer page
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
    When I select Authorised and click continue
    Then I am on the verifying account page
    When I receive a valid response
    Then I am on the technical difficulties page
