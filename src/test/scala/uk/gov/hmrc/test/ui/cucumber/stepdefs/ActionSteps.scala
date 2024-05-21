/*
 * Copyright 2023 HM Revenue & Customs
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package uk.gov.hmrc.test.ui.cucumber.stepdefs

import org.mongodb.scala.MongoClient
import org.openqa.selenium.Keys
import uk.gov.hmrc.test.ui.mongo.MongoHelper.GenericObservable
import uk.gov.hmrc.test.ui.pages._
import scala.sys.process._

class ActionSteps extends BaseSteps {

  Given("^I start a (.*)$") { (journey: String) =>
    MongoClient().getDatabase("p800-refunds-frontend").getCollection("journey").drop().head()
    journey match {
      case "journey"                         =>
        driver.navigate.to(TestOnlyClearAttemptsPage.url)
        TestOnlyClearAttemptsPage.assertPage()
      case "new journey" | "webhook journey" => ()
      case _                                 => throw new Exception(journey + " not found")
    }
    driver.navigate.to(TestOnlyStartPage.url)
    TestOnlyStartPage.assertPage()
    journey match {
      case "journey" | "new journey" =>
        clickByLinkText("start journey via gov-uk")
        TestOnlyGovUkPage.assertPage()
        clickByLinkText("Claim Now >")
      case "webhook journey"         =>
        MongoClient().getDatabase("p800-refunds-external-api").getCollection("fraud-check-status").drop().head()
        clickByLinkText("webhook notification")
      case _                         => throw new Exception(journey + " not found")
    }
  }

  When("^I select (.*) and click continue$") { (option: String) =>
    option match {
      case "yes to sign in"                                      => clickById("sign-in")
      case "not signed in"                                       => clickById("sign-in-2")
      case "yes, bank transfer"                                  => clickById("do-you-want-your-refund-via-bank-transfer")
      case "no I want a cheque"                                  => clickById("do-you-want-your-refund-via-bank-transfer-2")
      case "bank transfer using your Government Gateway user ID" => clickById("way-to-get-refund")
      case "cheque"                                              => clickById("way-to-get-refund-2")
      case "Authorised"                                          => clickById("bank-result")
      case "Cancelled"                                           => clickById("bank-result-2")
      case "Failed"                                              => clickById("bank-result-3")
      case "yes for address"                                     => clickById("address-up-to-date")
      case "no to update address"                                => clickById("address-up-to-date-2")
      case _                                                     => throw new Exception(option + " not found")
    }
    clickById("submit")
  }

  When("^I click to (.*)$") { (element: String) =>
    element match {
      case "approve the refund"                                                         => clickById("approve-this-refund")
      case "change date of birth"                                                       => clickById("change-date-of-birth")
      case "change nino"                                                                => clickById("change-national-insurance-number")
      case "change reference"                                                           => clickById("change-reference")
      case "choose another way to get my refund" | "claim your refund by bank transfer" =>
        clickById("choose-another-method-link")
      case "choose another way to get my refund via button"                             => clickById("try-again")
      case "continue"                                                                   => clickById("submit")
      case "submit refund request"                                                      => clickById("submit-refund-request")
      case "try again"                                                                  => clickById("try-again")
      case _                                                                            => throw new Exception(element + " not found")
    }
  }

  When("^I enter (.*) in the (.*) input and click continue$") { (userEntry: String, input: String) =>
    input match {
      case "reference"                 => enterTextById("reference", userEntry)
      case "national insurance number" => enterTextById("nationalInsuranceNumber", userEntry)
      case "date of birth"             =>
        enterTextById("date.day", userEntry.substring(0, 2))
        enterTextById("date.month", userEntry.substring(3, 5))
        enterTextById("date.year", userEntry.substring(6, 10))
      case "bank"                      =>
        enterTextById("selectedBankId", userEntry)
      case _                           => throw new Exception(input + " not found")
    }
    input match {
      case "bank"                                                      => clickById("continue")
      case "reference" | "national insurance number" | "date of birth" => clickById("submit")
      case _                                                           => throw new Exception(input + " not found")
    }
  }

  When("^I change the (.*) input to (.*) and click continue$") { (input: String, newAnswer: String) =>
    input match {
      case "reference"                 =>
        findElementById("reference").clear()
        enterTextById("reference", newAnswer)
      case "national insurance number" =>
        findElementById("nationalInsuranceNumber").clear()
        enterTextById("nationalInsuranceNumber", newAnswer)
      case "date of birth"             =>
        findElementById("date.day").clear()
        enterTextById("date.day", newAnswer.substring(0, 2))
        findElementById("date.month").clear()
        enterTextById("date.month", newAnswer.substring(3, 5))
        findElementById("date.year").clear()
        enterTextById("date.year", newAnswer.substring(6, 10))
      case "bank"                      =>
        clickById("selectedBankId")
        findElementById("selectedBankId").sendKeys(Keys.DELETE)
        enterTextById("selectedBankId", newAnswer)
      case _                           => throw new Exception(input + " not found")
    }
    input match {
      case "bank"                                                      => clickById("continue")
      case "reference" | "national insurance number" | "date of birth" => clickById("submit")
      case _                                                           => throw new Exception(input + " not found")
    }
  }

  When("^I click the link (.*)$") { (link: String) =>
    link match {
      case "Accessibility statement"                          => clickByLinkText("Accessibility statement")
      case "change my bank"                                   => clickById("change-bank")
      case "choose another way to get my refund"              => clickById("choose-another-way")
      case "contact HMRC" | "contact us"                      => clickById("contact-hmrc-link")
      case "contact us after lockout"                         => clickByCssSelector("p > a:nth-child(2)")
      case "contact us from lockout"                          => clickById("contact-hmrc")
      case "Cymraeg"                                          => clickByCssSelector("nav > ul > li:nth-child(2) > a")
      case "English"                                          => clickByCssSelector("nav > ul > li:nth-child(1) > a")
      case "get help to find it"                              => clickById("lost-national-insurance-number-link")
      case "Is this page not working"                         => clickByCssSelector(".hmrc-report-technical-issue")
      case "my bank is not listed"                            => clickById("myAccountIsNotListed")
      case "refresh this page"                                => clickById("refresh-this-page")
      case "Sign in using your Government Gateway user ID"    => clickById("personal-tax-account-sign-in")
      case "sign in to your HMRC online account"              => clickById("sign-in-to-your-hmrc-online-account")
      case "sign in to you HMRC online account after lockout" => clickByCssSelector("p > a:nth-child(1)")
      case "what did you think of this service"               => clickById("survey-link")
      case "write to us or call the Income Tax helpline"      => clickById("general-enquiries-link")
      case _                                                  => throw new Exception(link + " not found")
    }
  }

  When("I click browser back") { () =>
    driver.navigate().back()
  }

  When("""^I enter Record Id (.*), Record Type (.*) and Event Value (.*)$""") {
    (record_id: String, record_type: String, event_value: String) =>
      enterTextById("recordId", record_id)
      record_type match {
        case "AccountAssessment"  => clickById("recordType")
        case "ConsentTransaction" => clickById("recordType-2")
        case "Account"            => clickById("recordType-3")
        case "AccountTransaction" => clickById("recordType-4")
        case "StandingOrder"      => clickById("recordType-5")
        case "ScheduledPayment"   => clickById("recordType-6")
        case "DirectDebit"        => clickById("recordType-7")
        case "Consent"            => clickById("recordType-8")
        case _                    => throw new Exception(record_type + " not found")
      }
      event_value match {
        case "Valid"       => clickById("eventValue")
        case "NotValid"    => clickById("eventValue-2")
        case "NotReceived" => clickById("eventValue-3")
        case _             => throw new Exception(event_value + " not found")
      }
  }

  When("""^I receive a (.*) response$""") { (status: String) =>
    val accountSummaryResponse = MongoClient()
      .getDatabase("p800-refunds-frontend")
      .getCollection("journey")
      .find()
      .results()
      .toString()
    val index                  = accountSummaryResponse.indexOf("bankAccountSummary,{\"id\"")
    val consent_id             = accountSummaryResponse.substring(index + 27, index + 63)
    status match {
      case "valid"        =>
        s"""curl -v POST -H \"Content-Type: application/json\" -d '{\"event_value\":\"Valid\",\"record_type\":\"AccountAssessment\",\"record_id\":\"$consent_id\"}' http://localhost:10152/status""".!!
      case "not valid"    =>
        s"""curl -v POST -H \"Content-Type: application/json\" -d '{\"event_value\":\"NotValid\",\"record_type\":\"AccountAssessment\",\"record_id\":\"$consent_id\"}' http://localhost:10152/status""".!!
      case "not received" =>
        s"""curl -v POST -H \"Content-Type: application/json\" -d '{\"event_value\":\"NotReceived\",\"record_type\":\"AccountAssessment\",\"record_id\":\"$consent_id\"}' http://localhost:10152/status""".!!
      case _              => throw new Exception(status + " not found")
    }
  }

}
