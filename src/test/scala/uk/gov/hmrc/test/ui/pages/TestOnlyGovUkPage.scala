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

package uk.gov.hmrc.test.ui.pages

import uk.gov.hmrc.test.ui.conf.TestConfiguration

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
