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
import uk.gov.hmrc.test.ui.cucumber.stepdefs.BaseSteps

trait BasePage extends BaseSteps {

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

object TestOnlyWebhookPage extends BasePage {
  val h1    = "Simulate webhook notification"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/test-only/simulate-webhook"
  val title = ""
  override def assertPage(): Unit = {
    currentUrl           should include(url)
    currentPageHeading shouldBe h1
    currentPageTitle   shouldBe "Test Only - Get an Income Tax refund - GOV.UK"
  }
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

object DoYouWantToSignInWelshPage extends BasePage {
  val h1    = "A ydych am fewngofnodi?"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/do-you-want-to-sign-in"
  val title = ""
  override def assertPage(): Unit = {
    currentUrl           should include(url)
    currentPageHeading shouldBe h1
    currentPageTitle   shouldBe "A ydych am fewngofnodi? - Cael ad-daliad Treth Incwm - GOV.UK"
  }
}

object YouCannotConfirmYourIdentityYetPage extends BasePage {
  val h1    = "You cannot confirm your identity yet"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/you-cannot-confirm-your-identity-yet"
  val title = "You cannot confirm your identity yet"
}

object DoYouWantABankTransferPage extends BasePage {
  val h1    = "Do you want your refund by bank transfer?"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/do-you-want-your-refund-via-bank-transfer"
  val title = "Do you want your refund by bank transfer?"
}

object WeNeedToConfirmYourIdentityBankTransferPage extends BasePage {
  val h1    = "We need you to confirm your identity"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/bank-transfer/confirm-your-identity"
  val title = "We need you to confirm your identity"
}

object WhatIsP800ReferenceBankTransferPage extends BasePage {
  val h1    = "What is your P800 reference?"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/bank-transfer/enter-your-p800-reference"
  val title = "What is your P800 reference?"
}

object WhatIsNinoBankTransferPage extends BasePage {
  val h1    = "What is your National Insurance number?"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/bank-transfer/enter-your-national-insurance-number"
  val title = "What is your National Insurance number?"
}

object WhatIsDobPage extends BasePage {
  val h1    = "What is your date of birth?"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/bank-transfer/enter-your-date-of-birth"
  val title = "What is your date of birth?"
}

object CheckAnswersBankTransferPage extends BasePage {
  val h1    = "Check your answers"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/bank-transfer/check-your-answers"
  val title = "Check your answers"
}

object WeCannotConfirmYourIdentityBankTransferPage extends BasePage {
  val h1    = "We cannot confirm your identity"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/bank-transfer/cannot-confirm-your-identity-try-again"
  val title = "We cannot confirm your identity"
}

object ChooseAnotherWayBankTransferPage extends BasePage {
  val h1    = "Choose another way to get your refund"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/bank-transfer/choose-another-way-to-receive-your-refund"
  val title = "Choose another way to get your refund"
}

object WeCannotConfirmYourIdentityBankTransferLockedOutPage extends BasePage {
  val h1    = "We cannot confirm your identity"
  val url   =
    TestConfiguration.url("p800-refunds-frontend") + "/bank-transfer/no-more-attempts-left-to-confirm-your-identity"
  val title = "We cannot confirm your identity"
}

object ThereIsAProblemPage extends BasePage {
  val h1    = "There is a problem"
  val url   =
    TestConfiguration.url("p800-refunds-frontend") + "/there-is-a-problem"
  val title = "There is a problem"
}

object WeHaveConfirmedYourIdentityBankTransferPage extends BasePage {
  val h1    = "We have confirmed your identity"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/bank-transfer/your-identity-is-confirmed"
  val title = "We have confirmed your identity"
}

object WhatIsBankPage extends BasePage {
  val h1    = "What is the name of your bank?"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/bank-transfer/enter-name-of-your-bank"
  val title = "What is the name of your bank?"
}

object GiveYourConsentPage extends BasePage {
  val h1    = "Give your consent"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/bank-transfer/give-your-consent"
  val title = "Give your consent"
}

object BankStubPage extends BasePage {
  val h1    = "Bank Stub Page"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/test-only/bank-page"
  val title = ""
  override def assertPage(): Unit = {
    currentUrl           should include(url)
    currentPageHeading shouldBe h1
    currentPageTitle   shouldBe "Test Only - Get an Income Tax refund - GOV.UK"
  }
}

object VerifyingBankAccountPage extends BasePage {
  val h1    = "We are verifying your bank account"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/bank-transfer/verifying-your-bank-account"
  val title = "We are verifying your bank account"
}

object BankTransferRequestReceivedPage extends BasePage {
  val h1    = "Bank transfer request received"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/bank-transfer/request-received"
  val title = "Bank transfer request received"
}

object RefundRequestNotSubmittedPage extends BasePage {
  val h1    = "Your refund request has not been submitted"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/bank-transfer/refund-request-not-submitted"
  val title = "Your refund request has not been submitted"
}

object WeNeedToConfirmYourIdentityChequePage extends BasePage {
  val h1    = "We need you to confirm your identity"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/cheque/confirm-your-identity"
  val title = "We need you to confirm your identity"
}

object WhatIsP800ReferenceChequePage extends BasePage {
  val h1    = "What is your P800 reference?"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/cheque/enter-your-p800-reference"
  val title = "What is your P800 reference?"
}

object WhatIsNinoChequePage extends BasePage {
  val h1    = "What is your National Insurance number?"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/cheque/enter-your-national-insurance-number"
  val title = "What is your National Insurance number?"
}

object CheckAnswersChequePage extends BasePage {
  val h1    = "Check your answers"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/cheque/check-your-answers"
  val title = "Check your answers"
}

object WeCannotConfirmYourIdentityChequePage extends BasePage {
  val h1    = "We cannot confirm your identity"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/cheque/cannot-confirm-your-identity-try-again"
  val title = "We cannot confirm your identity"
}

object ChooseAnotherWayChequePage extends BasePage {
  val h1    = "Claim your refund by bank transfer"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/cheque/claim-your-refund-by-bank-transfer"
  val title = "Claim your refund by bank transfer"
}

object WeCannotConfirmYourIdentityChequeLockedOutPage extends BasePage {
  val h1    = "We cannot confirm your identity"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/cheque/no-more-attempts-left-to-confirm-your-identity"
  val title = "We cannot confirm your identity"
}

object WeHaveConfirmedYourIdentityChequePage extends BasePage {
  val h1    = "We have confirmed your identity"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/cheque/your-identity-is-confirmed"
  val title = "We have confirmed your identity"
}

object IsYourAddressUpToDatePage extends BasePage {
  val h1    = "Is your address up to date?"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/cheque/is-your-address-up-to-date"
  val title = "Is your address up to date?"
}

object UpdateYourAddressPage extends BasePage {
  val h1    = "Update your address"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/cheque/update-your-address"
  val title = "Update your address"
}

object ChequeRequestReceivedPage extends BasePage {
  val h1    = "Cheque request received"
  val url   = TestConfiguration.url("p800-refunds-frontend") + "/cheque/request-received"
  val title = "Cheque request received"
}

object FeedbackForChequePage extends BasePage {
  val h1    = "Give feedback"
  val url   =
    "http://localhost:9514/feedback/p800-refunds-cheque"
  val title = ""
  override def assertPage(): Unit = {
    currentUrl           should include(url)
    currentPageHeading shouldBe h1
    currentPageTitle   shouldBe "Give feedback - GOV.UK"
  }
}

object FeedbackForBankTransferPage extends BasePage {
  val h1    = "Give feedback"
  val url   =
    "http://localhost:9514/feedback/p800-refunds-bank-transfer"
  val title = ""
  override def assertPage(): Unit = {
    currentUrl           should include(url)
    currentPageHeading shouldBe h1
    currentPageTitle   shouldBe "Give feedback - GOV.UK"
  }
}

object TechnicalDifficultiesPage extends BasePage {
  val h1    = "Sorry, there is a problem with the service"
  val url   = TestConfiguration.url("p800-refunds-frontend")
  val title = "Sorry, there is a problem with the service - 500"
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
  val h1    = "Find your National Insurance number"
  val url   = "https://www.gov.uk/find-national-insurance-number"
  val title = ""
  override def assertPage(): Unit = {
    currentUrl           should include(url)
    currentPageHeading shouldBe h1
    currentPageTitle   shouldBe "Find your National Insurance number - GOV.UK"
  }
}

object AccessibilityStatementPage extends BasePage {
  val h1    = "Accessibility statement for Get an Income Tax refund service"
  val url   =
    "http://localhost:12346/accessibility-statement/get-an-income-tax-refund?referrerUrl=%2Fget-an-income-tax-refund%2Fdo-you-want-to-sign-in"
  val title = ""
  override def assertPage(): Unit = {
    currentUrl           should include(url)
    currentPageHeading shouldBe h1
    currentPageTitle   shouldBe "Accessibility statement for Get an Income Tax refund service – GOV.UK"
  }
}

object GetHelpPage extends BasePage {
  val h1    = "Get help with a technical problem"
  val url   =
    "http://localhost:9250/contact/report-technical-problem?newTab=true&service=p800-refunds-frontend&referrerUrl=%2Fget-an-income-tax-refund%2Fdo-you-want-to-sign-in"
  val title = ""
  override def assertPage(): Unit = {
    currentUrl           should include(url)
    currentPageHeading shouldBe h1
    currentPageTitle   shouldBe "Get help with a technical problem – GOV.UK"
  }
}
