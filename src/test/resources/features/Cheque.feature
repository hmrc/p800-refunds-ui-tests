@test
Feature: Cheque Journey

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
    When I enter 1234567890 in the reference input and click continue
    Then I am on the what is your national insurance number for cheque page

  Scenario: User completes a request for a cheque and visits the income tax helpline
    When I enter AB999999C in the national insurance number input and click continue
    Then I am on the check answers for cheque page
    And The page has rows for just reference and NINO with NINO AB999999C
    When I click to continue
    Then I am on the we have confirmed your identity for cheque page
    When I click to continue
    Then I am on the is your address up to date page
    When I select yes for address and click continue
    Then I am on the cheque request received page
    And The page contains 1234567890
    When I click the link call or write to the Income Tax helpline
    Then I am on the income tax page in a new tab

  Scenario: User completes a request for a cheque and decides to give feedback
    When I enter AB999999C in the national insurance number input and click continue
    Then I am on the check answers for cheque page
    And The page has rows for just reference and NINO with NINO AB999999C
    When I click to continue
    Then I am on the we have confirmed your identity for cheque page
    When I click to continue
    Then I am on the is your address up to date page
    When I select yes for address and click continue
    Then I am on the cheque request received page
    And The page contains 1234567890
    When I click the link what did you think of this service
    Then I am on the feedback page
    # test to be adjusted when feedback page created

  Scenario: User completes a request for a cheque and clicks back
    When I enter AB999999C in the national insurance number input and click continue
    Then I am on the check answers for cheque page
    And The page has rows for just reference and NINO with NINO AB999999C
    When I click to continue
    Then I am on the we have confirmed your identity for cheque page
    When I click to continue
    Then I am on the is your address up to date page
    When I select yes for address and click continue
    Then I am on the cheque request received page
    And The page contains 1234567890
    When I click browser back
    Then I am on the cheque request received page
    And The page contains 1234567890

  Scenario: User changes address for their cheque
    When I enter AB999999C in the national insurance number input and click continue
    Then I am on the check answers for cheque page
    And The page has rows for just reference and NINO with NINO AB999999C
    When I click to continue
    Then I am on the we have confirmed your identity for cheque page
    When I click to continue
    Then I am on the is your address up to date page
    When I select no to update address and click continue
    Then I am on the update your address page
    When I click the link contact HMRC
    Then I am on the change your address page

  Scenario: User checks for NINO
    When I click the dropdown link find a lost National Insurance number
    Then I am on the lost national insurance number page in a new tab

  Scenario: Payable order API returns 422
    When I enter AB909999C in the national insurance number input and click continue
    Then I am on the check answers for cheque page
    And The page has rows for just reference and NINO with NINO AB909999C
    When I click to continue
    Then I am on the we have confirmed your identity for cheque page
    When I click to continue
    Then I am on the is your address up to date page
    When I select yes for address and click continue
    Then I am on the technical difficulties page
