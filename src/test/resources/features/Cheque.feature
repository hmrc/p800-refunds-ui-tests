@test @jenkins @a11y @zap
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
    Then I am on the your cheque will be posted page

  Scenario Outline: User completes a request for a cheque
    When I click to submit refund request
    Then I am on the cheque request received page
    And The cheque request received page contains reference P800REFNO1
    When I click the link <link>
#    Then I am on the <page> page in a new tab --- waiting on a fix as part of OPS-11132
    Examples:
      | link                                     | page          |
      | call or write to the Income Tax helpline | income tax    |

  Scenario: User changes address for their cheque
    When I click the link contact HMRC
    Then I am on the change your address page

