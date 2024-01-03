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

import java.time.Duration

import org.openqa.selenium.support.ui.{ExpectedConditions, WebDriverWait}
import uk.gov.hmrc.test.ui.pages._

class AssertionSteps extends BaseStepDef {

  Then("^I am on the (.*) page$") { (page: String) =>
    page match {
      case "do you want to sign in"           => eventually(DoYouWantToSignInPage.assertPage())
      case "auth login"                       => eventually(AuthLoginPage.assertPage())
      case "what is your reference"           => eventually(WhatIsP800ReferencePage.assertPage())
      case "check your reference"             => eventually(CheckYourReferencePage.assertPage())
      case "do you want a bank transfer"      => eventually(DoYouWantABankTransferPage.assertPage())
      case "complete your refund request"     => eventually(CompleteYourRefundRequestPage.assertPage())
      case "cheque request received"          => eventually(ChequeRequestReceivedPage.assertPage())
      case "change your address"              => eventually(ChangeYourDetailsPage.assertPage())
      case "we cannot confirm your reference" => eventually(WeCannotConfirmYourReferencePage.assertPage())
      case "feedback"                         => eventually(FeedbackPage.assertPage())
      case _                                  => throw new Exception(page + " not found")
    }
  }

  Then("^I am on the (.*) page in a new tab$") { (page: String) =>
    new WebDriverWait(driver, Duration.ofSeconds(10)).until(ExpectedConditions.numberOfWindowsToBe(2))
    val windows = driver.getWindowHandles.toArray().toSeq
    driver.switchTo().window(windows(1).toString)
    page match {
      case "income tax" =>
        eventually(IncomeTaxPage.assertPage())
      case _            => throw new Exception(page + " not found")
    }
    driver.close()
    driver.switchTo().window(windows(0).toString)
  }

  Then("^The (.*) page contains reference (.*)$") { (page: String, reference: String) =>
    page match {
      case "check your reference"    => findTextByCssSelector("p.govuk-body") shouldBe s"You entered $reference."
      case "cheque request received" =>
        findTextByCssSelector("div.govuk-panel__body") shouldBe s"Your P800 reference:\n$reference"
      case _                         => throw new Exception(page + " not found")
    }
  }

}
