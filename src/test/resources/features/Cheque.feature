@test @jenkins
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
    Then I am on the what is your reference page
    When I enter P800REFNO1 in the reference input and click continue
    Then I am on the what is your national insurance number page

  Scenario: User completes a request for a cheque and visits the income tax helpline
    When I enter AA000000A in the national insurance number input and click continue
    Then I am on the check answers for cheque page
    And The page has rows for just reference and NINO with NINO AA000000A
    When I click to continue
    Then I am on the we have confirmed your identity page
    When I click to continue
    Then I am on the complete your refund request page
    When I click to submit refund request
    Then I am on the cheque request received page
    And The page contains P800REFNO1
    When I click the link call or write to the Income Tax helpline
    Then I am on the income tax page in a new tab

  Scenario: User completes a request for a cheque and decides to give feedback
    When I enter AA000000A in the national insurance number input and click continue
    Then I am on the check answers for cheque page
    And The page has rows for just reference and NINO with NINO AA000000A
    When I click to continue
    Then I am on the we have confirmed your identity page
    When I click to continue
    Then I am on the complete your refund request page
    When I click to submit refund request
    Then I am on the cheque request received page
    And The page contains P800REFNO1
    When I click the link what did you think of this service
    Then I am on the feedback page
    # test to be adjusted when feedback page created

  @a11y @zap
  Scenario: User completes a request for a cheque and clicks back
    When I enter AA000000A in the national insurance number input and click continue
    Then I am on the check answers for cheque page
    And The page has rows for just reference and NINO with NINO AA000000A
    When I click to continue
    Then I am on the we have confirmed your identity page
    When I click to continue
    Then I am on the complete your refund request page
    When I click to submit refund request
    Then I am on the cheque request received page
    And The page contains P800REFNO1
    When I click browser back
    Then I am on the cheque request received page
    And The page contains P800REFNO1

  @a11y
  Scenario: User changes address for their cheque
    When I enter AA000000A in the national insurance number input and click continue
    Then I am on the check answers for cheque page
    And The page has rows for just reference and NINO with NINO AA000000A
    When I click to continue
    Then I am on the we have confirmed your identity page
    When I click to continue
    Then I am on the complete your refund request page
    When I click the dropdown link contact HMRC
    Then I am on the change your address page

  @a11y
  Scenario: User checks for NINO
    When I click the dropdown link find a lost National Insurance number
    Then I am on the lost national insurance number page in a new tab

