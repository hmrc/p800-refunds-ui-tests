@test @jenkins @a11y @zap
Feature: User reference is ineligible

  Scenario: User realises reference is incorrect
    Given I start a journey
    Then I am on the do you want to sign in page
    When I select not signed in and click continue
    Then I am on the what is your reference page
    When I enter P800REFNO2 in the reference input and click continue
    Then I am on the check your reference page
    And The check your reference page contains reference P800REFNO2
    When I select no it's not correct and click continue
    Then I am on the what is your reference page

  Scenario: User submits ineligible reference
    Given I start a journey
    Then I am on the do you want to sign in page
    When I select not signed in and click continue
    Then I am on the what is your reference page
    When I enter INVALIDREF1 in the reference input and click continue
    Then I am on the check your reference page
    And The check your reference page contains reference INVALIDREF1
    When I select yes it's correct and click continue
    Then I am on the we cannot confirm your reference page
    When I click to try again
    Then I am on the what is your reference page