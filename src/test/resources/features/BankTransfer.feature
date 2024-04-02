@test
Feature: Bank Transfer Journey

  Background:
    Given I start a journey
    Then I am on the do you want to sign in page
    When I select not signed in and click continue
    Then I am on the do you want a bank transfer page
    When I select yes, bank transfer and click continue
    Then I am on the we need to confirm your identity for bank transfer page
    And The page lists reference, NINO and DOB
    When I click to continue
    Then I am on the what is your reference for bank transfer page
    When I enter 1234567890 in the reference input and click continue
    Then I am on the what is your national insurance number for bank transfer page

  Scenario: User completes a bank transfer and visits the income tax helpline
    When I enter AB999999C in the national insurance number input and click continue
    Then I am on the what is your date of birth page
    When I enter 01 01 2000 in the date of birth input and click continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB with NINO AB999999C
    When I click to continue
    Then I am on the we have confirmed your identity for bank transfer page
    When I click to continue
    Then I am on the what is the name of your bank page
    When I enter Chase in the bank input and click continue
    Then I am on the give your permission page
    And The first paragraph contains Chase
    When I click to approve the refund
    Then I am on the bank stub page
    When I select Authorised and click continue
    Then I am on the verifying account page
    When I click the link refresh this page
    Then I am on the verifying account page
    When I receive a valid response
    Then I am on the bank transfer request received page
    And The page contains 1234567890
    When I click the link call or write to the Income Tax helpline
    Then I am on the income tax page in a new tab

  Scenario: User completes a bank transfer and decides to give feedback
    When I enter AB999999C in the national insurance number input and click continue
    Then I am on the what is your date of birth page
    When I enter 01 01 2000 in the date of birth input and click continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB with NINO AB999999C
    When I click to continue
    Then I am on the we have confirmed your identity for bank transfer page
    When I click to continue
    Then I am on the what is the name of your bank page
    When I enter Monzo Business in the bank input and click continue
    Then I am on the give your permission page
    And The first paragraph contains Monzo Business
    When I click to approve the refund
    Then I am on the bank stub page
    When I select Authorised and click continue
    Then I am on the verifying account page
    When I click the link refresh this page
    Then I am on the verifying account page
    When I receive a valid response
    Then I am on the bank transfer request received page
    And The page contains 1234567890
    When I click the link what did you think of this service
#    Then I am on the feedback page

  Scenario: User completes a bank transfer and clicks back
    When I enter AB999999C in the national insurance number input and click continue
    Then I am on the what is your date of birth page
    When I enter 01 01 2000 in the date of birth input and click continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB with NINO AB999999C
    When I click to continue
    Then I am on the we have confirmed your identity for bank transfer page
    When I click to continue
    Then I am on the what is the name of your bank page
    When I enter Santander Personal in the bank input and click continue
    Then I am on the give your permission page
    And The first paragraph contains Santander Personal
    When I click to approve the refund
    Then I am on the bank stub page
    When I select Authorised and click continue
    Then I am on the verifying account page
    When I click the link refresh this page
    Then I am on the verifying account page
    When I receive a valid response
    Then I am on the bank transfer request received page
    And The page contains 1234567890
    When I click browser back
    Then I am on the bank stub page
    When I click browser back
    Then I am on the bank transfer request received page
    And The page contains 1234567890

  Scenario: User's bank is not listed and they apply for cheque instead
    When I enter AB999999C in the national insurance number input and click continue
    Then I am on the what is your date of birth page
    When I enter 01 01 2000 in the date of birth input and click continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB with NINO AB999999C
    When I click to continue
    Then I am on the we have confirmed your identity for bank transfer page
    When I click to continue
    Then I am on the what is the name of your bank page
    When I click the link my bank is not listed
    Then I am on the choose another way to receive your refund from bank transfer page
    When I select cheque and click continue
    Then I am on the is your address up to date page
    When I select yes for address and click continue
    Then I am on the cheque request received page
    And The page contains 1234567890

  Scenario: User chooses to apply for cheque from the give permission page
    When I enter AB999999C in the national insurance number input and click continue
    Then I am on the what is your date of birth page
    When I enter 01 01 2000 in the date of birth input and click continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB with NINO AB999999C
    When I click to continue
    Then I am on the we have confirmed your identity for bank transfer page
    When I click to continue
    Then I am on the what is the name of your bank page
    When I enter Chase in the bank input and click continue
    Then I am on the give your permission page
    And The first paragraph contains Chase
    When I click the link choose another way to get my money
    Then I am on the choose another way to receive your refund from bank transfer page
    When I select cheque and click continue
    Then I am on the is your address up to date page
    When I select yes for address and click continue
    Then I am on the cheque request received page
    And The page contains 1234567890

  Scenario: User fails ecospend check so applies for cheque instead
    When I enter AB999999C in the national insurance number input and click continue
    Then I am on the what is your date of birth page
    When I enter 01 01 2000 in the date of birth input and click continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB with NINO AB999999C
    When I click to continue
    Then I am on the we have confirmed your identity for bank transfer page
    When I click to continue
    Then I am on the what is the name of your bank page
    When I enter Chase in the bank input and click continue
    Then I am on the give your permission page
    And The first paragraph contains Chase
    Then I am on the give your permission page
    And The first paragraph contains Chase
    When I click to approve the refund
    Then I am on the bank stub page
    When I select Authorised and click continue
    Then I am on the verifying account page
    When I click the link refresh this page
    Then I am on the verifying account page
    When I receive a not valid response
    Then I am on the refund request not submitted page
    When I click to choose another way to get my money
    Then I am on the choose another way to receive your refund from bank transfer page
    When I select cheque and click continue
    Then I am on the is your address up to date page
    When I select yes for address and click continue
    Then I am on the cheque request received page
    And The page contains 1234567890

  Scenario: User fails ecospend check and they click back
    When I enter AB999999C in the national insurance number input and click continue
    Then I am on the what is your date of birth page
    When I enter 01 01 2000 in the date of birth input and click continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB with NINO AB999999C
    When I click to continue
    Then I am on the we have confirmed your identity for bank transfer page
    When I click to continue
    Then I am on the what is the name of your bank page
    When I enter Chase in the bank input and click continue
    Then I am on the give your permission page
    And The first paragraph contains Chase
    Then I am on the give your permission page
    And The first paragraph contains Chase
    When I click to approve the refund
    Then I am on the bank stub page
    When I select Authorised and click continue
    Then I am on the verifying account page
    When I click the link refresh this page
    Then I am on the verifying account page
    When I receive a not valid response
    Then I am on the refund request not submitted page
    When I click browser back
    Then I am on the bank stub page
    When I click browser back
    Then I am on the refund request not submitted page

  Scenario: User decides to change bank account from the give permission page
    When I enter AB999999C in the national insurance number input and click continue
    Then I am on the what is your date of birth page
    When I enter 01 01 2000 in the date of birth input and click continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB with NINO AB999999C
    When I click to continue
    Then I am on the we have confirmed your identity for bank transfer page
    When I click to continue
    Then I am on the what is the name of your bank page
    When I enter Chase in the bank input and click continue
    Then I am on the give your permission page
    And The first paragraph contains Chase
    When I click the link change my bank
    Then I am on the what is the name of your bank page
    When I change the bank input to Barclays Personal and click continue
    Then I am on the give your permission page
    And The first paragraph contains Barclays Personal

  Scenario: User checks for NINO
    When I click the dropdown link find a lost National Insurance number
    Then I am on the lost national insurance number page in a new tab

  Scenario: User stays on verifying page after ecospend sends no response
    When I enter AB999999C in the national insurance number input and click continue
    Then I am on the what is your date of birth page
    When I enter 01 01 2000 in the date of birth input and click continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB with NINO AB999999C
    When I click to continue
    Then I am on the we have confirmed your identity for bank transfer page
    When I click to continue
    Then I am on the what is the name of your bank page
    When I enter Chase in the bank input and click continue
    Then I am on the give your permission page
    And The first paragraph contains Chase
    Then I am on the give your permission page
    And The first paragraph contains Chase
    When I click to approve the refund
    Then I am on the bank stub page
    When I select Authorised and click continue
    Then I am on the verifying account page
    When I click the link refresh this page
    Then I am on the verifying account page
    When I receive a not received response
    And I click the link refresh this page
    Then I am on the verifying account page

  Scenario: User fails EDH risk check
    When I enter AB919999C in the national insurance number input and click continue
    Then I am on the what is your date of birth page
    When I enter 01 01 2000 in the date of birth input and click continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB with NINO AB919999C
    When I click to continue
    Then I am on the we have confirmed your identity for bank transfer page
    When I click to continue
    Then I am on the what is the name of your bank page
    When I enter Chase in the bank input and click continue
    Then I am on the give your permission page
    And The first paragraph contains Chase
    When I click to approve the refund
    Then I am on the bank stub page
    When I select Authorised and click continue
    Then I am on the verifying account page
    When I click the link refresh this page
    Then I am on the verifying account page
    When I receive a valid response
    Then I am on the refund request not submitted page

  #TODO: click failed or cancelled on bank stub