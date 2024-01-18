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
      case "do you want to sign in"                      => eventually(DoYouWantToSignInPage.assertPage())
      case "auth login"                                  => eventually(AuthLoginPage.assertPage())
      case "what is your reference"                      => eventually(WhatIsP800ReferencePage.assertPage())
      case "do you want a bank transfer"                 => eventually(DoYouWantABankTransferPage.assertPage())
      case "complete your refund request"                => eventually(CompleteYourRefundRequestPage.assertPage())
      case "cheque request received"                     => eventually(ChequeRequestReceivedPage.assertPage())
      case "change your address"                         => eventually(ChangeYourDetailsPage.assertPage())
      case "we need to confirm your identity for cheque" =>
        eventually(WeNeedToConfirmYourIdentityChequePage.assertPage())
      case "what is your national insurance number"      => eventually(WhatIsNinoPage.assertPage())
      case "check answers for cheque"                    => eventually(CheckAnswersPage.assertPage())
      case "we have confirmed your identity"             => eventually(WeHaveConfirmedYourIdentityPage.assertPage())
      case "feedback"                                    => eventually(FeedbackPage.assertPage())
      case _                                             => throw new Exception(page + " not found")
    }
  }

  Then("^I am on the (.*) page in a new tab$") { (page: String) =>
    new WebDriverWait(driver, Duration.ofSeconds(10)).until(ExpectedConditions.numberOfWindowsToBe(2))
    val windows = driver.getWindowHandles.toArray().toSeq
    driver.switchTo().window(windows(1).toString)
    page match {
      case "income tax"                     => eventually(IncomeTaxPage.assertPage())
      case "lost national insurance number" => eventually(LostNationalInsuranceNumberPage.assertPage())
      case "print preview"                  => driver.getCurrentUrl shouldBe "chrome://print/"
      case _                                => throw new Exception(page + " not found")
    }
    driver.close()
    driver.switchTo().window(windows(0).toString)
  }

  Then("^The page contains reference (.*)$") { (reference: String) =>
    findTextByCssSelector("div.govuk-panel__body") shouldBe s"Your P800 reference:\n$reference"
  }

  Then("^The page lists (.*)$") { (items: String) =>
    items match {
      case "just reference and NINO" =>
        findTextByCssSelector("ul.govuk-list--bullet") shouldBe s"P800 reference\nnational insurance number"
      case _                         => throw new Exception(items + " not found")
    }
  }

  Then("^The page has rows for (.*)$") { (rows: String) =>
    rows match {
      case "just reference and NINO" =>
        findTextByCssSelector("dl > div:nth-child(1)") shouldBe s"P800 reference\nP800REFNO1\nChange\nP800 reference"
        findTextByCssSelector(
          "dl > div:nth-child(2)"
        )                                              shouldBe s"National insurance number\nAA000000A\nChange\nNational insurance number"
        isPresent("Date of birth")                     shouldBe false
      case _                         => throw new Exception(rows + " not found")
    }
  }

}
