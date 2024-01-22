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
      case "auth login"                                               => eventually(AuthLoginPage.assertPage())
      case "bank transfer request received"                           => eventually(BankTransferRequestReceivedPage.assertPage())
      case "change your address"                                      => eventually(ChangeYourDetailsPage.assertPage())
      case "check answers for bank transfer"                          => eventually(CheckAnswersBankTransferPage.assertPage())
      case "check answers for cheque"                                 => eventually(CheckAnswersChequePage.assertPage())
      case "cheque request received"                                  => eventually(ChequeRequestReceivedPage.assertPage())
      case "choose another way to receive your refund"                => eventually(ChooseAnotherWayPage.assertPage())
      case "complete your refund request"                             => eventually(CompleteYourRefundRequestPage.assertPage())
      case "do you want a bank transfer"                              => eventually(DoYouWantABankTransferPage.assertPage())
      case "do you want to sign in"                                   => eventually(DoYouWantToSignInPage.assertPage())
      case "feedback"                                                 => eventually(FeedbackPage.assertPage())
      case "give your permission"                                     => eventually(GiveYourPermissionPage.assertPage())
      case "refund request not submitted"                             => eventually(RefundRequestNotSubmittedPage.assertPage())
      case "verifying account"                                        => eventually(VerifyingBankAccountPage.assertPage())
      case "we cannot confirm your identity"                          => eventually(WeCannotConfirmYourIdentityPage.assertPage())
      case "we have confirmed your identity for bank transfer"        =>
        eventually(WeHaveConfirmedYourIdentityBankTransferPage.assertPage())
      case "we have confirmed your identity for cheque"               =>
        eventually(WeHaveConfirmedYourIdentityChequePage.assertPage())
      case "we need to confirm your identity for bank transfer"       =>
        eventually(WeNeedToConfirmYourIdentityBankTransferPage.assertPage())
      case "we need to confirm your identity for cheque"              =>
        eventually(WeNeedToConfirmYourIdentityChequePage.assertPage())
      case "what is the name of your bank"                            => eventually(WhatIsBankPage.assertPage())
      case "what is your date of birth"                               => eventually(WhatIsDobPage.assertPage())
      case "what is your national insurance number for bank transfer" =>
        eventually(WhatIsNinoBankTransferPage.assertPage())
      case "what is your national insurance number for cheque"        => eventually(WhatIsNinoChequePage.assertPage())
      case "what is your reference for bank transfer"                 => eventually(WhatIsP800ReferenceBankTransferPage.assertPage())
      case "what is your reference for cheque"                        => eventually(WhatIsP800ReferenceChequePage.assertPage())
      case _                                                          => throw new Exception(page + " not found")
    }
  }

  Then("^I am on the (.*) page in a new tab$") { (page: String) =>
    new WebDriverWait(driver, Duration.ofSeconds(10)).until(ExpectedConditions.numberOfWindowsToBe(2))
    val windows = driver.getWindowHandles.toArray().toSeq
    driver.switchTo().window(windows(1).toString)
    page match {
      case "income tax"                     => eventually(IncomeTaxPage.assertPage())
      case "lost national insurance number" => eventually(LostNationalInsuranceNumberPage.assertPage())
      case _                                => throw new Exception(page + " not found")
    }
    driver.close()
    driver.switchTo().window(windows(0).toString)
  }

  Then("^The (.*) contains (.*)$") { (feature: String, input: String) =>
    feature match {
      case "first paragraph" =>
        findTextByCssSelector(
          "p:nth-child(2)"
        ) shouldBe s"By choosing approve, you will be redirected to $input to securely log in and approve your refund of £1,231.22. Change my bank."
      case "page"            => findTextByCssSelector("div.govuk-panel__body") shouldBe s"Your P800 reference:\n$input"
      case "redirect url"    =>
        findElementById("redirectionUrl").getAttribute("value") shouldBe s"http://localhost:9416$input"
    }
  }

  Then("^The page lists (.*)$") { (items: String) =>
    items match {
      case "just reference and NINO" =>
        findTextByCssSelector("ul.govuk-list--bullet") shouldBe s"P800 reference\nnational insurance number"
      case "reference, NINO and DOB" =>
        findTextByCssSelector(
          "ul.govuk-list--bullet"
        ) shouldBe s"P800 reference\nnational insurance number\ndate of birth"
      case _                         => throw new Exception(items + " not found")
    }
  }

  Then("^The page has rows for (.*) with NINO (.*)$") { (rows: String, nino: String) =>
    rows match {
      case "just reference and NINO"                          =>
        findTextByCssSelector("dl > div:nth-child(1)") shouldBe s"P800 reference\nP800REFNO1\nChange\nP800 reference"
        findTextByCssSelector(
          "dl > div:nth-child(2)"
        )                                              shouldBe s"National insurance number\n$nino\nChange\nNational insurance number"
        isPresent("Date of birth")                     shouldBe false
      case "just reference and NINO with the changed answers" =>
        findTextByCssSelector(
          "dl > div:nth-child(1)"
        )                          shouldBe s"P800 reference\nP800REFChanged\nChange\nP800 reference"
        findTextByCssSelector(
          "dl > div:nth-child(2)"
        )                          shouldBe s"National insurance number\n$nino\nChange\nNational insurance number"
        isPresent("Date of birth") shouldBe false
      case "reference, NINO and DOB"                          =>
        findTextByCssSelector("dl > div:nth-child(1)") shouldBe s"P800 reference\nP800REFNO1\nChange\nP800 reference"
        findTextByCssSelector(
          "dl > div:nth-child(2)"
        )                                              shouldBe s"National insurance number\n$nino\nChange\nNational insurance number"
        findTextByCssSelector(
          "dl > div:nth-child(3)"
        )                                              shouldBe s"Date of birth\n01 January 2000\nChange\nDate of birth"
      case "reference, NINO and DOB with the changed answers" =>
        findTextByCssSelector(
          "dl > div:nth-child(1)"
        ) shouldBe s"P800 reference\nP800REFChanged\nChange\nP800 reference"
        findTextByCssSelector(
          "dl > div:nth-child(2)"
        ) shouldBe s"National insurance number\n$nino\nChange\nNational insurance number"
        findTextByCssSelector(
          "dl > div:nth-child(3)"
        ) shouldBe s"Date of birth\n10 October 1990\nChange\nDate of birth"
      case _                                                  => throw new Exception(rows + " not found")
    }
  }

}
