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

import config.MessageReader._
import io.cucumber.datatable.DataTable
import org.openqa.selenium.support.ui.ExpectedConditions
import org.openqa.selenium.{By, JavascriptExecutor, NoSuchElementException}
import java.time.format.DateTimeFormatter
import scala.jdk.CollectionConverters._

class PageStepDefs extends MpeSteps {

  val upload: XPathQuery = XPathQuery("//*[@id=\"upload-button\"]")

  When("""^I select the "(.*)" option$""") { button: String =>
    val buttonId = getMessage(button)
    clickOnLink(IdQuery(buttonId))
  }

  When("""^I wait for "(.*)" link to be visible$""") { link: String =>
    retryUntil(_ => {
      pageRefresh()
      Thread.sleep(400)
      find(By.linkText(link)).isDisplayed
    }, timeoutSeconds = 1200, ignoring = List(classOf[NoSuchElementException]))
  }

  Then("""^I should be on the "(.*)" page""") { title: String =>
    if (title.contains("protected allowances")) {
      waitForTitle(s"$title - GOV.UK")
    }
    else if(title.contains("feedback")){
     waitForTitle(s"$title - GOV.UK")
    }
    else {
      waitForTitle(s"$title - Check a pension scheme member’s protections and enhancements")
    }
  }

  Then("""^I should be on the page "(.*)"""") { title: String =>
    waitForTitle(title)
  }

  Then("""^I should be on a MPE checker error page""") { () =>
    isGmpCheckerErrorPage should equal(true)
  }

  Then("""^I should see the following values on the page$""") { dataTable: DataTable =>
    dataTable.asMaps(classOf[String], classOf[String]).asScala.foreach((data: java.util.Map[String, String]) => {
      val text = getMessage(data.get("value"))
      pageSource should include(text)
    })
  }

  Then("""^I should not see the "(.*)" table$""") { name: String =>
    intercept[NoSuchElementException] {
      find(By.id(name))
    }
  }

  Then("""^I should see "(.*)"$""") { text: String =>
    pageSource should include(text)
  }

  Then("""^I should see hint text "(.*)" on the page$""") { text: String =>
    pageSource should include(text)
  }

  Then("""^I should not see "(.*)"$""") { text: String =>
    pageSource should not include text
  }

  Then("""^I should not see "(.*)" on the page$""") { text: String =>
    getElementText(TagNameQuery("body")) should not include text
  }

  Then("""^I should not see the "(.*)" link on the page$""") { link: String =>
    intercept[NoSuchElementException] {
      find(By.linkText(link))
    }
  }

  When("""^I select the "(.*)" file$""") { file: String =>
    setTextField(IdQuery("fileToUpload"), s"$userDir/src/test/resources/files/$file")
  }

  When("""^I click the "(.*)" error link$""") { error: String =>
    val errorLink = driver.findElement(By.linkText(error))
    val js = driver.asInstanceOf[JavascriptExecutor]
    js.executeScript("arguments[0].click()", errorLink)
  }

  Then("""^I should see the following errors notification on the page$""") { dataTable: DataTable =>
    dataTable.asMaps(classOf[String], classOf[String]).asScala.foreach((data: java.util.Map[String, String]) => {
      getErrorMessages should contain(data.get("error"))
    })
  }

  Then("""^The error link should show "(.*)"$""") { error: String =>
    fluentWait().until(ExpectedConditions.elementToBeClickable(By.linkText(error)))
  }

  Then("""^I should see error message "(.*)" on the page$""") { message: String =>
    getErrorMessages.contains(message) should be(true)
  }

  Then("""^I should see the "(.*)" link on the page$""") { linkText: String =>
    driver.findElement(By.linkText(linkText))
  }

  Then("""^I should see the following links on the page$""") { dataTable: DataTable =>
    dataTable.asMaps(classOf[String], classOf[String]).asScala.foreach((data: java.util.Map[String, String]) => {
      val link = getMessage(data.get("links"))
      driver.findElement(By.linkText(link))
      pageSource should include(link)
    })
  }

  Then("""^I should see the "(.*)" button on the page$""") { button: String =>
    driver.findElement(By.xpath(s"//button[contains(text(),'$button')]"))
  }

  Then("""^I should not see the "(.*)" button on the page$""") { button: String =>
    intercept[NoSuchElementException] {
      driver.findElement(By.id(button)).isEnabled should be(false)
    }
  }

  Then("""^I should see "(.*)" error on the page$""") { text: String =>
    pageSource should include(text)
  }

  Then("""^I should see the "(.*)" error link on the page$""") { error: String =>
    find(By.linkText(error))
  }

  Then("""^I save a screenshot with the filename "(.*)"$""") { filename: String =>
    capture to filename
  }

  Then("""^I refresh the page$""") {
    pageRefresh()
  }

  When("""^I clear the "(.*)" field$""") { fieldId: String =>
    clearTextField(IdQuery(fieldId))
  }

  When("""^I click on the "(.*)" link$""") { Id: String =>
    clickOnLink(IdQuery(Id))
  }

  And("""^The Checked On time stamp should display current date and time$""") {
    val timeStamp = java.time.LocalDateTime.now()
    val formatter = DateTimeFormatter.ofPattern("dd MMMM yyyy 'at' HH:mm")
    timeStamp.format(formatter)
    assert(timeStamp != null, "Current date and time is null")
    println(s"Validated current date and time: $timeStamp")
  }

  Then("""^The "(.*)" tables contain:$""") { (cardType: String, dataTable: DataTable) =>
    val rows = dataTable.asMaps(classOf[String], classOf[String]).asScala
    rows.foreach { row =>
      val scalaRow = row.asScala
      val protectionType = scalaRow("Type")
      val container = driver.findElement(By.xpath(s"//*[contains(text(), '$protectionType')]/ancestor::div[contains(@class, 'govuk-summary-card')]"))
      def verifyIfPresent(label: String, expected: String): Unit = {
        if (expected.nonEmpty) {
          val xpath = s".//div[contains(@class,'govuk-summary-list__row')][dt[contains(normalize-space(.), '$label')]]/dd"
          val actual = container.findElement(By.xpath(xpath)).getText.trim
          assert(actual == expected, s"For $protectionType - $label: expected '$expected' but found '$actual'")
        }
      }
      verifyIfPresent("Status", Option(row.get("Status")).getOrElse(""))
      verifyIfPresent("Protected amount", Option(row.get("Protected amount")).getOrElse(""))
      verifyIfPresent("Lump Sum", Option(row.get("Lump Sum")).getOrElse(""))
      if (cardType == "Protection") verifyIfPresent("Factor", Option(row.get("Factor")).getOrElse("")) else verifyIfPresent("Enhancement factor", Option(row.get("Enhancement factor")).getOrElse(""))
      verifyIfPresent("Protection reference number", Option(row.get("Reference number")).getOrElse(""))
    }
  }
}
