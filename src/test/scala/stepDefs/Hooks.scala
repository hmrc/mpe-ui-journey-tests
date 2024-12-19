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

import config.MessageReader
import io.cucumber.scala.{EN, ScalaDsl, Scenario}
import org.apache.commons.io.FileUtils
import org.openqa.selenium.{OutputType, TakesScreenshot, WebDriver}
import uk.gov.hmrc.selenium.webdriver.Browser

import java.io.File

object Hooks extends ScalaDsl with EN with Browser with BrowserDriver with MpeSteps {

    // To take a screeshot and embed in to the Cucumber report
    private def takeScreenshot(scenario: Scenario, s: String, dr: WebDriver with TakesScreenshot): Unit = {
        val name = scenario.getName

        if (!new java.io.File(s"./target/screenshots/$name$s.png").exists) {
            dr.manage().window().maximize()
            val scr = dr.getScreenshotAs(OutputType.FILE)
            FileUtils.copyFile(scr, new File(s"./target/screenshots/$name$s.png"))
            val byteFile = dr.getScreenshotAs(OutputType.BYTES)
            scenario.attach(byteFile, "image/png", "")
        }
    }

    Before {
        startBrowser()
        if (MessageReader.scenarioLoop) {
            driver.manage().deleteAllCookies()
            MessageReader.scenarioLoop = false
        }
    }

    After { scenario: Scenario =>
        if (!MessageReader.scenarioLoop) {
            MessageReader.scenarioLoop = true
            if (scenario.isFailed) {
                driver match {
                    case a: TakesScreenshot =>
                        takeScreenshot(scenario, "-page-on-failure", a)
                        println(s"Failure page  : $currentUrl")
                        a.navigate().back()
                        takeScreenshot(scenario, "-previous-page", a)
                        println(s"Previous page : $currentUrl")

                    case _ => throw new Exception("Driver cannot take screenshot.")
                }
            }
            quitBrowser()
        }
    }

}

