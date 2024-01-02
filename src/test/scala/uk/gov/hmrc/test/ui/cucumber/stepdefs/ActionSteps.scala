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

import uk.gov.hmrc.test.ui.pages._

class ActionSteps extends BaseStepDef {

  Given("I start a journey") { () =>
    driver.navigate.to(TestOnlyStartPage.url)
    TestOnlyStartPage.assertPage()
    clickByLinkText("start journey via gov-uk")
    TestOnlyGovUkPage.assertPage()
    clickByLinkText("Claim Now >")
  }

  When("^I select (.*) and click continue$") { (option: String) =>
    option match {
      case "yes to sign in"      => clickById("sign-in")
      case "not signed in"       => clickById("sign-in-2")
      case "yes it's correct"    => clickById("reference-check")
      case "no it's not correct" => clickById("reference-check-2")
      case "no I want a cheque"  => clickById("do-you-want-your-refund-via-bank-transfer-2")
      case _                     => throw new Exception(option + " not found")
    }
    clickById("submit")
  }

  When("^I click to (.*)$") { (element: String) =>
    element match {
      case "submit refund request" => clickById("submit-refund-request")
      case "try again"             => clickById("try-again")
      case _                       => throw new Exception(element + " not found")
    }
  }

  When("^I enter (.*) in the (.*) input and click continue$") { (userEntry: String, input: String) =>
    input match {
      case "reference" => enterTextById("reference", userEntry)
      case _           => throw new Exception(input + " not found")
    }
    clickById("submit")
  }

  When("^I click the link (.*)$") { (link: String) =>
    link match {
      case "Sign in using your Government Gateway user ID" => clickById("personal-tax-account-sign-in")
      case "call or write to the Income Tax helpline"      => clickById("general-enquiries-link")
      case "contact HMRC"                                  =>
        clickByCssSelector("span.govuk-details__summary-text")
        clickById("contact-hmrc-link")
      case "what did you think of this service"            => clickById("survey-link")
      case _                                               => throw new Exception(link + " not found")
    }
  }

  When("I click browser back") { () =>
    driver.navigate().back()
  }

}
