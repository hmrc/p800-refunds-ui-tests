@test @jenkins
Feature: Cheque Journey

  Background:
    Given I start a journey
    Then I am on the do you want to sign in page
    When I select not signed in and click continue
    Then I am on the what is your reference page
    When I enter P800REFNO1 in the reference input and click continue
    Then I am on the check your reference page
    And The check your reference page contains reference P800REFNO1
    When I select yes it's correct and click continue
    Then I am on the do you want a bank transfer page
    When I select no I want a cheque and click continue
    Then I am on the complete your refund request page

  Scenario: User completes a request for a cheque and visits the income tax helpline
    When I click to submit refund request
    Then I am on the cheque request received page
    And The cheque request received page contains reference P800REFNO1
    When I click the link call or write to the Income Tax helpline
    Then I am on the income tax page in a new tab

  Scenario: User completes a request for a cheque and decides to give feedback
    When I click to submit refund request
    Then I am on the cheque request received page
    And The cheque request received page contains reference P800REFNO1
    When I click the link what did you think of this service
    Then I am on the feedback page
    # test to be adjusted when feedback page created

  @a11y @zap
  Scenario: User completes a request for a cheque and clicks back
    When I click to submit refund request
    Then I am on the cheque request received page
    And The cheque request received page contains reference P800REFNO1
    When I click browser back
    Then I am on the cheque request received page
    And The cheque request received page contains reference P800REFNO1

  @a11y
  Scenario: User changes address for their cheque
    When I click the link contact HMRC
    Then I am on the change your address page

