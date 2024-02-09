@test @jenkins
Feature: Ecospend APIs

  Scenario Outline: Consent API fails
    Given I start a journey
    Then I am on the do you want to sign in page
    When I select not signed in and click continue
    Then I am on the do you want a bank transfer page
    When I select yes, bank transfer and click continue
    Then I am on the we need to confirm your identity for bank transfer page
    And The page lists reference, NINO and DOB
    When I click to continue
    Then I am on the what is your reference for bank transfer page
    When I enter P800REFNO1 in the reference input and click continue
    Then I am on the what is your national insurance number for bank transfer page
    When I enter AA000000A in the national insurance number input and click continue
    Then I am on the what is your date of birth page
    When I enter 01 01 2000 in the date of birth input and click continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB with NINO AA000000A
    When I click to continue
    Then I am on the we have confirmed your identity for bank transfer page
    When I click to continue
    Then I am on the what is the name of your bank page
    When I enter Test | <error bank> in the bank input and click continue
    Then I am on the give your permission page
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