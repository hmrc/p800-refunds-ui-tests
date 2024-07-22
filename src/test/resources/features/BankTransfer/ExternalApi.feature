@test
Feature: Ecospend Webhook API

  Scenario Outline: External API webhook
    Given I start a webhook journey
    Then I am on the simulate webhook page
    When I enter Record Id <record_id>, Record Type <record_type> and Event Value <event_value>
    And I click to continue
    Then A notification is sent with the correct <record_id>, <record_type> and <event_value>
    And Mongo is populated with the correct <record_id>, <record_type> and <event_value>
    Examples:
      | record_id | record_type        | event_value |
      | TestAAV   | AccountAssessment  | Valid       |
      | TestAANV  | AccountAssessment  | NotValid    |
      | TestAANV  | AccountAssessment  | NotReceived |
      | TestCTV   | ConsentTransaction | Valid       |
      | TestCTNV  | ConsentTransaction | NotValid    |
      | TestCTNV  | ConsentTransaction | NotReceived |
      | TestAV    | Account            | Valid       |
      | TestANV   | Account            | NotValid    |
      | TestANV   | Account            | NotReceived |
      | TestATV   | AccountTransaction | Valid       |
      | TestATNV  | AccountTransaction | NotValid    |
      | TestATNV  | AccountTransaction | NotReceived |
      | TestSOV   | StandingOrder      | Valid       |
      | TestSONV  | StandingOrder      | NotValid    |
      | TestSONV  | StandingOrder      | NotReceived |
      | TestSPV   | ScheduledPayment   | Valid       |
      | TestSPNV  | ScheduledPayment   | NotValid    |
      | TestSPNV  | ScheduledPayment   | NotReceived |
      | TestDDV   | DirectDebit        | Valid       |
      | TestDDNV  | DirectDebit        | NotValid    |
      | TestDDNV  | DirectDebit        | NotReceived |
      | TestCV    | Consent            | Valid       |
      | TestCNV   | Consent            | NotValid    |
      | TestCNV   | Consent            | NotReceived |
