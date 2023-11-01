@test @jenkins @zap @a11y
Feature: Logged in journey

  Scenario: User chooses to log in to make payment
    Given I start a journey
    Then I am on the do you want to sign in page
    When I select yes to sign in
    And I click continue
    Then I am on the auth login page

  Scenario: User chooses to log in from reference page
    Given I start a journey
    Then I am on the do you want to sign in page
    When I select not signed in
    And I click continue
    Then I am on the what is your reference page
    When I select Sign in or create a personal tax account
    Then I am on the auth login page

  Scenario: User chooses to visit income tax helpline
    Given I start a journey
    Then I am on the do you want to sign in page
    When I select not signed in
    And I click continue
    Then I am on the what is your reference page
    When I select Call the income tax helpline
    Then I am on the income tax page