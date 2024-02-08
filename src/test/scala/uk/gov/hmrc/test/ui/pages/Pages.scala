/*
 * Copyright 2024 HM Revenue & Customs
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

package uk.gov.hmrc.test.ui.pages

import uk.gov.hmrc.test.ui.conf.TestConfiguration
import uk.gov.hmrc.test.ui.cucumber.stepdefs.BaseStepDef

trait BasePage extends BaseStepDef {

  val h1: String
  val url: String
  val title: String
  val serviceName: String = "Get an Income Tax refund"

  def currentUrl: String = driver.getCurrentUrl()

  def currentPageTitle: String = driver.getTitle

  def currentPageHeading: String = findTextByTagName("h1")

  def assertPage(): Unit = {
    currentUrl           should include(url)
    currentPageHeading shouldBe h1
    currentPageTitle   shouldBe s"$title - $serviceName - GOV.UK"
  }

}

object TestOnlyStartPage extends BasePage {
  val h1    = "Test Only Landing Page"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/test-only"
  val title = ""
  override def assertPage(): Unit = {
    currentUrl           should include(url)
    currentPageHeading shouldBe h1
    currentPageTitle   shouldBe "Test Only - Get an Income Tax refund - GOV.UK"
  }
}

object TestOnlyClearAttemptsPage extends BasePage {
  val h1                          = ""
  val url                         = TestConfiguration.url("p800-refunds-frontend") + "/test-only/clear-attempts"
  val title                       = ""
  override def assertPage(): Unit =
    currentUrl should include(url)
}

object TestOnlyGovUkPage extends BasePage {
  val h1    = "Tax overpayments and underpayments"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/test-only/gov-uk-route-in"
  val title = ""
  override def assertPage(): Unit = {
    currentUrl           should include(url)
    currentPageHeading shouldBe h1
    currentPageTitle   shouldBe "Test Only - Get an Income Tax refund - GOV.UK"
  }
}

object DoYouWantToSignInPage extends BasePage {
  val h1    = "Do you want to sign in?"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/do-you-want-to-sign-in"
  val title = "Do you want to sign in?"
}

object DoYouWantABankTransferPage extends BasePage {
  val h1    = "Do you want your refund by bank transfer?"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/do-you-want-your-refund-via-bank-transfer"
  val title = "Do you want to refund by bank transfer?"
}

object WeNeedToConfirmYourIdentityBankTransferPage extends BasePage {
  val h1    = "We need you to confirm your identity"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/bank-transfer/confirm-your-identity"
  val title = "Bank transfer - confirm your identity"
}

object WhatIsP800ReferenceBankTransferPage extends BasePage {
  val h1    = "What is your P800 reference?"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/bank-transfer/enter-your-p800-reference"
  val title = "Bank transfer - enter your p800 reference"
}

object WhatIsNinoBankTransferPage extends BasePage {
  val h1    = "What is your National Insurance number?"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/bank-transfer/enter-your-national-insurance-number"
  val title = "Bank transfer - enter your National Insurance number"
}

object WhatIsDobPage extends BasePage {
  val h1    = "What is your date of birth?"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/bank-transfer/enter-your-date-of-birth"
  val title = "Bank transfer - enter your date of birth"
}

object CheckAnswersBankTransferPage extends BasePage {
  val h1    = "Check your answers"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/bank-transfer/check-your-answers"
  val title = "Bank transfer - check your answers"
}

object WeCannotConfirmYourIdentityBankTransferPage extends BasePage {
  val h1    = "We cannot confirm your identity"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/bank-transfer/cannot-confirm-your-identity-try-again"
  val title = "Bank transfer - cannot confirm your identity try again"
}

object ChooseAnotherWayBankTransferPage extends BasePage {
  val h1    = "Choose another way to receive your refund"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/bank-transfer/choose-another-way-to-receive-your-refund"
  val title = "Bank transfer - choose another way to receive your refund"
}

object WeCannotConfirmYourIdentityBankTransferLockedOutPage extends BasePage {
  val h1    = "We cannot confirm your identity"
  val url   =
    TestConfiguration.url("p800-refunds-frontend") + "/bank-transfer/no-more-attempts-left-to-confirm-your-identity"
  val title = "Bank transfer - no more attempts left to confirm your identity"
}

object WeHaveConfirmedYourIdentityBankTransferPage extends BasePage {
  val h1    = "We have confirmed your identity"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/bank-transfer/your-identity-is-confirmed"
  val title = "Bank transfer - your identity is confirmed"
}

object WhatIsBankPage extends BasePage {
  val h1    = "What is the name of your bank?"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/bank-transfer/enter-name-of-your-bank"
  val title = "Bank transfer - enter name of your bank"
}

object GiveYourPermissionPage extends BasePage {
  val h1    = "Give your permission"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/bank-transfer/give-your-permission"
  val title = "Bank transfer - give your permission"
}

object VerifyingBankAccountPage extends BasePage {
  val h1    = "We are verifying your bank account"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/bank-transfer/verifying-your-bank-account"
  val title = "Bank transfer - verifying your bank account"
}

object BankTransferRequestReceivedPage extends BasePage {
  val h1    = "Bank transfer request received"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/bank-transfer/request-received"
  val title = "Bank transfer - request received"
}

object RefundRequestNotSubmittedPage extends BasePage {
  val h1    = "Your refund request has not been submitted"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/bank-transfer/refund-request-not-submitted"
  val title = "Bank transfer - refund request not submitted"
}

object WeNeedToConfirmYourIdentityChequePage extends BasePage {
  val h1    = "We need you to confirm your identity"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/cheque/confirm-your-identity"
  val title = "Cheque - confirm your identity"
}

object WhatIsP800ReferenceChequePage extends BasePage {
  val h1    = "What is your P800 reference?"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/cheque/enter-your-p800-reference"
  val title = "Cheque - enter your p800 reference"
}

object WhatIsNinoChequePage extends BasePage {
  val h1    = "What is your National Insurance number?"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/cheque/enter-your-national-insurance-number"
  val title = "Cheque - enter your National Insurance number"
}

object CheckAnswersChequePage extends BasePage {
  val h1    = "Check your answers"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/cheque/check-your-answers"
  val title = "Cheque - check your answers"
}

object WeCannotConfirmYourIdentityChequePage extends BasePage {
  val h1    = "We cannot confirm your identity"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/cheque/cannot-confirm-your-identity-try-again"
  val title = "Cheque - cannot confirm your identity try again"
}

object ChooseAnotherWayChequePage extends BasePage {
  val h1    = "Choose another way to receive your refund"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/cheque/choose-another-way-to-receive-your-refund"
  val title = "Cheque - choose another way to receive your refund"
}

object WeCannotConfirmYourIdentityChequeLockedOutPage extends BasePage {
  val h1    = "We cannot confirm your identity"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/cheque/no-more-attempts-left-to-confirm-your-identity"
  val title = "Cheque - no more attempts left to confirm your identity"
}

object WeHaveConfirmedYourIdentityChequePage extends BasePage {
  val h1    = "We have confirmed your identity"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/cheque/your-identity-is-confirmed"
  val title = "Cheque - your identity is confirmed"
}

object CompleteYourRefundRequestPage extends BasePage {
  val h1    = "Complete your refund request to get your cheque"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/cheque/complete-refund-request"
  val title = "Cheque - complete refund request"
}

object ChequeRequestReceivedPage extends BasePage {
  val h1    = "Cheque request received"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/cheque/request-received"
  val title = "Cheque - request received"
}

object FeedbackPage extends BasePage {
  // TO BE UPDATED WHEN WE SET UP FEEDBACK SERVICE
  val h1    = "Cheque request received"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/cheque/request-received#"
  val title = "Cheque - request received"
}

object AuthLoginPage extends BasePage {
  val h1    = "Authority Wizard"
  val url   =
    "http://localhost:9949/auth-login-stub/gg-sign-in?continue=http%3A%2F%2Flocalhost%3A9416%2Ftax-you-paid%2Fchoose-year&accountType=individual"
  val title = ""
  override def assertPage(): Unit = {
    currentUrl           should include(url)
    currentPageHeading shouldBe h1
    currentPageTitle   shouldBe "Authority Wizard"
  }
}

object ChangeYourDetailsPage extends BasePage {
  val h1    = "Change your address and personal details"
  val url   =
    "https://www.gov.uk/government/organisations/hm-revenue-customs/contact/change-your-personal-details"
  val title = ""
  override def assertPage(): Unit = {
    currentUrl           should include(url)
    currentPageHeading shouldBe h1
    currentPageTitle   shouldBe "Change your address and personal details - GOV.UK"
  }
}

object IncomeTaxPage extends BasePage {
  val h1    = "Income Tax: general enquiries"
  val url   =
    "https://www.gov.uk/government/organisations/hm-revenue-customs/contact/income-tax-enquiries-for-individuals-pensioners-and-employees"
  val title = ""
  override def assertPage(): Unit = {
    currentUrl           should include(url)
    currentPageHeading shouldBe h1
    currentPageTitle   shouldBe "Income Tax: general enquiries - GOV.UK"
  }
}

object LostNationalInsuranceNumberPage extends BasePage {
  val h1    = "Find a lost National Insurance number"
  val url   = "https://www.gov.uk/lost-national-insurance-number"
  val title = ""
  override def assertPage(): Unit = {
    currentUrl           should include(url)
    currentPageHeading shouldBe h1
    currentPageTitle   shouldBe "Find a lost National Insurance number - GOV.UK"
  }
}
