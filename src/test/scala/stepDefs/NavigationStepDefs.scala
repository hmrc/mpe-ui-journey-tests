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

import com.vladsch.flexmark.parser.core.delimiter.Bracket.link
import config.Configuration
import org.openqa.selenium.{By, JavascriptExecutor}

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

  When("""^I click on the Change link for "(.*)"$""") { ( link: String) =>
    clickOnChangeLink(link)
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

