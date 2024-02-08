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

import org.openqa.selenium.Keys
import uk.gov.hmrc.test.ui.pages._

class ActionSteps extends BaseStepDef {

  Given("I start a journey") { () =>
    driver.navigate.to(TestOnlyClearAttemptsPage.url)
    TestOnlyClearAttemptsPage.assertPage()
    driver.navigate.to(TestOnlyStartPage.url)
    TestOnlyStartPage.assertPage()
    clickByLinkText("start journey via gov-uk")
    TestOnlyGovUkPage.assertPage()
    clickByLinkText("Claim Now >")
  }

  When("^I select (.*) and click continue$") { (option: String) =>
    option match {
      case "yes to sign in"                                      => clickById("sign-in")
      case "not signed in"                                       => clickById("sign-in-2")
      case "yes, bank transfer"                                  => clickById("do-you-want-your-refund-via-bank-transfer")
      case "no I want a cheque"                                  => clickById("do-you-want-your-refund-via-bank-transfer-2")
      case "bank transfer using your Government Gateway user ID" => clickById("way-to-get-refund")
      case "cheque" | "bank transfer logged out"                 => clickById("way-to-get-refund-2")
      case "Authorised"                                          => clickById("bank-result")
      case "Cancelled"                                           => clickById("bank-result-2")
      case "Failed"                                              => clickById("bank-result-3")
      case _                                                     => throw new Exception(option + " not found")
    }
    clickById("submit")
  }

  When("^I click to (.*)$") { (element: String) =>
    element match {
      case "approve the refund"                 => clickById("approve-this-refund")
      case "change date of birth"               => clickById("change-date-of-birth")
      case "change nino"                        => clickById("change-national-insurance-number")
      case "change reference"                   => clickById("change-reference")
      case "choose another method"              => clickById("choose-another-method-link")
      case "choose another way to get my money" => clickById("try-again")
      case "continue"                           => clickById("submit")
      case "submit refund request"              => clickById("submit-refund-request")
      case "try again"                          => clickById("try-again")
      case _                                    => throw new Exception(element + " not found")
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
      case "call or write to the Income Tax helpline"      => clickById("general-enquiries-link")
      case "change my bank"                                => clickById("change-bank")
      case "choose another way to get my money"            => clickById("choose-another-way")
      case "my bank is not listed"                         => clickById("myAccountIsNotListed")
      case "refresh this page"                             => clickById("refresh-this-page")
      case "Sign in using your Government Gateway user ID" => clickById("personal-tax-account-sign-in")
      case "sign in to you HMRC online account"            => clickById("sign-in-to-you-hmrc-online-account")
      case "what did you think of this service"            => clickById("survey-link")
      case _                                               => throw new Exception(link + " not found")
    }
  }

  When("^I click the dropdown link (.*)$") { (link: String) =>
    clickByCssSelector("span.govuk-details__summary-text")
    link match {
      case "contact HMRC"                          => clickById("contact-hmrc-link")
      case "find a lost National Insurance number" => clickById("lost-national-insurance-number-link")
      case _                                       => throw new Exception(link + " not found")
    }
  }

  When("I click browser back") { () =>
    driver.navigate().back()
  }

  When("""^I navigate to test-only and select (.*)$""") { (result: String) =>
    driver.navigate.to(TestOnlyStartPage.url)
    TestOnlyStartPage.assertPage()
    result match {
      case "request success" => clickByLinkText("Finish Succeed")
      case "request failed"  => clickByLinkText("Finish Fail")
      case _                 => throw new Exception(result + " not found")
    }
  }

}
