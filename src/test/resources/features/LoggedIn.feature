@test @jenkins @zap @a11y
Feature: Logged in journey

  Scenario: User chooses to log in to make payment
    Given I start a journey
    Then I am on the do you want to sign in page
    When I select yes to sign in
    And I click continue
    Then I am on the government gateway page