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

package stepDefs

import config.Configuration
import org.openqa.selenium.JavascriptExecutor

class NavigationStepDefs extends MpeSteps {
  val environmentProperty: String = System.getProperty("environment", "local")
  implicit var host: String = ""
  var currentUrl = ""
  environmentProperty.trim.toLowerCase match {
    case "local" | "dev" | "qa" | "staging" => host = s"${Configuration.settings.link}"
    case _ => throw new IllegalArgumentException("Unknown environment")
  }

  When("""^I visit the "(.*?)" page$""") { page: String =>
    val url = page match {
      case "start" => "start"
      case _ => page
    }
    go to s"${Configuration.settings.link}/${Configuration.baseUrl}/$url"
  }

  When("""^I click the "(.*)" link$""") { link: String =>
    if (link.contains("Back")) {
      val js = driver.asInstanceOf[JavascriptExecutor]
      js.executeScript("window.scrollBy(0,1000)")
    }
    clickOnLink(LinkTextQuery(link))
  }

  When("""^I click the "(.*)" button$""") { button: String =>
    clickOnLink(XPathQuery(s"//button[contains(text(),'$button')]"))
  }

  When("""^I click "(.*)" button$""") { button: String =>
    clickOnLink(IdQuery(button))
  }

  When("""^I click "(.*)" link""") { id: String =>
    clickOnLink(className(id))
  }

  When("""I select the "(.*)" radio button on the "(.*)" page$""") { (button: String, page: String) =>
    page match {
      case "What type of calculation do you need?"            => calculationTypeSelect(button)
      case "Has the member left the scheme?"                  => hasMemberLeftSelect(button)
      case "Had the member already left the scheme at date of death?" => hasMemberLeftSelect(button)
      case "What revaluation rate do you want HMRC to use?"   => revalRateSelect(button)
      case "Do you also want an opposite gender calculation?" => genderCalcSelect(button)
      case "Did the member leave the scheme before 6 April 2016?" => leftBeforeApril2016Select(button)
      case "Would you like a calculation for a date after the date of death?" => dateAfterDeathSelect(button)
    }
  }

  When("""^I click the "(.*)" checkbox$""") { box: String =>
    checkbox(box).select()
  }

  When("""^I browse back""") {
    browserBack()
  }

  When("""^I copy the URL$""") {
    currentUrl = driver.getCurrentUrl
  }

  When("""^I paste the URL$""") {
    go to currentUrl
  }

  Given("""^I have a new session""") {
    delete all cookies
  }

}

