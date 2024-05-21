@test
Feature: Page Links

  Background:
    Given I start a journey
    Then I am on the do you want to sign in page

  Scenario: User selects to toggles language to Welsh
    When I click the link Cymraeg
    Then I am on the do you want to sign in welsh page
    When I click the link English
    Then I am on the do you want to sign in page

  Scenario: User visits accessibility statement
    When I click the link Accessibility statement
    Then I am on the accessibility statement page

  Scenario: User reports technical issues
    When I click the link Is this page not working
    Then I am on the get help page in a new tab