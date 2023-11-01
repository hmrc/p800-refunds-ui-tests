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

class StepDef extends BaseStepDef {

  Given("I start a journey") { () =>
    driver.navigate.to(TestOnlyStartPage.url)
    TestOnlyStartPage.assertPage()
    clickByLinkText("start journey via gov-uk")
    TestOnlyGovUkPage.assertPage()
    clickByLinkText("Claim Now >")
  }

  Then("^I am on the (.*) page$") { (page: String) =>
    page match {
      case "do you want to sign in" => eventually(DoYouWantToSignInPage.assertPage())
      case "auth login"             => eventually(AuthLoginPage.assertPage())
      case "what is your reference" => eventually(WhatIsP800ReferencePage.assertPage())
      case "income tax"             =>
        new WebDriverWait(driver, Duration.ofSeconds(10)).until(ExpectedConditions.numberOfWindowsToBe(2))
        val windows = driver.getWindowHandles.toArray().toSeq
        driver.switchTo().window(windows(1).toString)
        eventually(IncomeTaxPage.assertPage())
    }
  }

  When("^I select (.*)$") { (page: String) =>
    page match {
      case "yes to sign in"                           => clickById("sign-in")
      case "not signed in"                            => clickById("sign-in-2")
      case "Sign in or create a personal tax account" => clickById("personal-tax-account-sign-in")
      case "Call the income tax helpline"             => clickById("income-tax-general-enquiries")
    }
  }

  And("I click continue") { () =>
    clickById("submit")
  }

}
