@test @jenkins
Feature: Changing Answers

  Background:
    Given I start a journey
    Then I am on the do you want to sign in page
    When I select not signed in and click continue
    Then I am on the do you want a bank transfer page

  Scenario: Cheque journey answers are saved when revisiting pages
    When I select no I want a cheque and click continue
    Then I am on the we need to confirm your identity for cheque page
    And The page lists just reference and NINO
    When I click to continue
    Then I am on the what is your reference for cheque page
    When I enter 1234567890 in the reference input and click continue
    Then I am on the what is your national insurance number for cheque page
    When I enter AB999999C in the national insurance number input and click continue
    Then I am on the check answers for cheque page
    And The page has rows for just reference and NINO with NINO AB999999C
    When I click to change reference
    Then I am on the what is your reference for cheque page
    When I click to continue
    Then I am on the check answers for cheque page
    And The page has rows for just reference and NINO with NINO AB999999C
    When I click to change nino
    Then I am on the what is your national insurance number for cheque page
    When I click to continue
    Then I am on the check answers for cheque page
    And The page has rows for just reference and NINO with NINO AB999999C

  Scenario: Cheque journey answers can be changed
    When I select no I want a cheque and click continue
    Then I am on the we need to confirm your identity for cheque page
    And The page lists just reference and NINO
    When I click to continue
    Then I am on the what is your reference for cheque page
    When I enter 1234567890 in the reference input and click continue
    Then I am on the what is your national insurance number for cheque page
    When I enter AB999999C in the national insurance number input and click continue
    Then I am on the check answers for cheque page
    And The page has rows for just reference and NINO with NINO AB999999C
    When I click to change reference
    Then I am on the what is your reference for cheque page
    When I change the reference input to 234567890 and click continue
    Then I am on the check answers for cheque page
    When I click to change nino
    Then I am on the what is your national insurance number for cheque page
    When I change the national insurance number input to BB999999B and click continue
    Then I am on the check answers for cheque page
    And The page has rows for just reference and NINO with the changed answers with NINO BB999999B

  Scenario: Bank transfer journey answers are saved when revisiting pages
    Then I am on the do you want a bank transfer page
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
    When I click to change reference
    Then I am on the what is your reference for bank transfer page
    When I click to continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB with NINO AB999999C
    When I click to change nino
    Then I am on the what is your national insurance number for bank transfer page
    When I click to continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB with NINO AB999999C
    When I click to change date of birth
    Then I am on the what is your date of birth page
    When I click to continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB with NINO AB999999C

  Scenario: Bank transfer journey answers can be changed
    Then I am on the do you want a bank transfer page
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
    When I click to change reference
    Then I am on the what is your reference for bank transfer page
    When I change the reference input to 234567890 and click continue
    Then I am on the check answers for bank transfer page
    When I click to change nino
    Then I am on the what is your national insurance number for bank transfer page
    When I change the national insurance number input to BB999999B and click continue
    Then I am on the check answers for bank transfer page
    When I click to change date of birth
    Then I am on the what is your date of birth page
    When I change the date of birth input to 10 10 1990 and click continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB with the changed answers with NINO BB999999B