@test @jenkins
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
    Then I am on the what is your reference page
    When I enter P800REFNO1 in the reference input and click continue
    Then I am on the what is your national insurance number page

  Scenario: User completes a bank transfer and visits the income tax helpline
    When I enter AA000000A in the national insurance number input and click continue
    Then I am on the what is your date of birth page
    When I enter 01 01 2000 in the date of birth input and click continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB
    When I click to continue
    Then I am on the we have confirmed your identity page
    When I click to continue
    Then I am on the what is the name of your bank page
    When I enter Chase in the bank input and click continue
    Then I am on the give your permission page
    And The top paragraph mentions the bank Chase
    When I click to approve the refund
    Then I am on the verifying account page
    When I click the link refresh this page
    Then I am on the verifying account page
    When I navigate to test-only and select request success
    Then I am on the bank transfer request received page
    And The page contains reference P800REFNO1
    When I click the link call or write to the Income Tax helpline
    Then I am on the income tax page in a new tab

  Scenario: User completes a bank transfer and decides to give feedback
    When I enter AA000000A in the national insurance number input and click continue
    Then I am on the what is your date of birth page
    When I enter 01 01 2000 in the date of birth input and click continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB
    When I click to continue
    Then I am on the we have confirmed your identity page
    When I click to continue
    Then I am on the what is the name of your bank page
    When I enter Monzo Business in the bank input and click continue
    Then I am on the give your permission page
    And The top paragraph mentions the bank Monzo Business
    When I click to approve the refund
    Then I am on the verifying account page
    When I click the link refresh this page
    Then I am on the verifying account page
    When I navigate to test-only and select request success
    Then I am on the bank transfer request received page
    And The page contains reference P800REFNO1
    When I click the link what did you think of this service
#    Then I am on the feedback page

  @a11y @zap
  Scenario: User completes a bank transfer and clicks back
    When I enter AA000000A in the national insurance number input and click continue
    Then I am on the what is your date of birth page
    When I enter 01 01 2000 in the date of birth input and click continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB
    When I click to continue
    Then I am on the we have confirmed your identity page
    When I click to continue
    Then I am on the what is the name of your bank page
    When I enter Santander Personal in the bank input and click continue
    Then I am on the give your permission page
    And The top paragraph mentions the bank Santander Personal
    When I click to approve the refund
    Then I am on the verifying account page
    When I click the link refresh this page
    Then I am on the verifying account page
    When I navigate to test-only and select request success
    Then I am on the bank transfer request received page
    And The page contains reference P800REFNO1
    When I click browser back
#    Then I am on the bank transfer request received page
#    And The page contains reference P800REFNO1

  Scenario: User's bank is not listed and they apply for cheque instead
    When I enter AA000000A in the national insurance number input and click continue
    Then I am on the what is your date of birth page
    When I enter 01 01 2000 in the date of birth input and click continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB
    When I click to continue
    Then I am on the we have confirmed your identity page
    When I click to continue
    Then I am on the what is the name of your bank page
    When I click the link my bank is not listed
    Then I am on the choose another way to receive your refund page
    When I select cheque and click continue
    Then I am on the complete your refund request page
    When I click to submit refund request
    Then I am on the cheque request received page
    And The page contains reference P800REFNO1

  Scenario: User chooses to apply for cheque from the give permission page
    When I enter AA000000A in the national insurance number input and click continue
    Then I am on the what is your date of birth page
    When I enter 01 01 2000 in the date of birth input and click continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB
    When I click to continue
    Then I am on the we have confirmed your identity page
    When I click to continue
    Then I am on the what is the name of your bank page
    When I enter Chase in the bank input and click continue
    Then I am on the give your permission page
    And The top paragraph mentions the bank Chase
    When I click the link choose another way to get my money
    Then I am on the choose another way to receive your refund page
    When I select cheque and click continue
    Then I am on the complete your refund request page
    When I click to submit refund request
    Then I am on the cheque request received page
    And The page contains reference P800REFNO1

  @a11y @zap
  Scenario: User's refund request is not submitted so applies for cheque instead
    When I enter AA000000A in the national insurance number input and click continue
    Then I am on the what is your date of birth page
    When I enter 01 01 2000 in the date of birth input and click continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB
    When I click to continue
    Then I am on the we have confirmed your identity page
    When I click to continue
    Then I am on the what is the name of your bank page
    When I enter Chase in the bank input and click continue
    Then I am on the give your permission page
    And The top paragraph mentions the bank Chase
    Then I am on the give your permission page
    And The top paragraph mentions the bank Chase
    When I click to approve the refund
    Then I am on the verifying account page
    When I click the link refresh this page
    Then I am on the verifying account page
    When I navigate to test-only and select request failed
    Then I am on the refund request not submitted page
    When I click to choose another way to get my money
    Then I am on the choose another way to receive your refund page
    When I select cheque and click continue
    Then I am on the complete your refund request page
    When I click to submit refund request
    Then I am on the cheque request received page
    And The page contains reference P800REFNO1

  Scenario: User's refund request is not submitted so they click back
    When I enter AA000000A in the national insurance number input and click continue
    Then I am on the what is your date of birth page
    When I enter 01 01 2000 in the date of birth input and click continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB
    When I click to continue
    Then I am on the we have confirmed your identity page
    When I click to continue
    Then I am on the what is the name of your bank page
    When I enter Chase in the bank input and click continue
    Then I am on the give your permission page
    And The top paragraph mentions the bank Chase
    Then I am on the give your permission page
    And The top paragraph mentions the bank Chase
    When I click to approve the refund
    Then I am on the verifying account page
    When I click the link refresh this page
    Then I am on the verifying account page
    When I navigate to test-only and select request failed
    Then I am on the refund request not submitted page
    When I click browser back
#    Then I am on the refund request not submitted page

  Scenario: User decides to change bank account from the give permission page
    When I enter AA000000A in the national insurance number input and click continue
    Then I am on the what is your date of birth page
    When I enter 01 01 2000 in the date of birth input and click continue
    Then I am on the check answers for bank transfer page
    And The page has rows for reference, NINO and DOB
    When I click to continue
    Then I am on the we have confirmed your identity page
    When I click to continue
    Then I am on the what is the name of your bank page
    When I enter Chase in the bank input and click continue
    Then I am on the give your permission page
    And The top paragraph mentions the bank Chase
    When I click the link change my bank
    Then I am on the what is the name of your bank page
    When I enter Barclays Personal in the bank input and click continue
    Then I am on the give your permission page
    And The top paragraph mentions the bank Barclays Personal

  @a11y
  Scenario: User checks for NINO
    When I click the dropdown link find a lost National Insurance number
    Then I am on the lost national insurance number page in a new tab