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

import io.cucumber.scala.{EN, ScalaDsl}
import org.junit.Assert
import org.openqa.selenium._
import org.openqa.selenium.support.ui.{ExpectedConditions, FluentWait, Select, Wait}
import org.scalatest.Assertion
import org.scalatest.matchers.should.Matchers
import org.scalatestplus.selenium.WebBrowser
import uk.gov.hmrc.selenium.webdriver.Browser

import java.time.Duration
import java.util
import scala.jdk.CollectionConverters._
import scala.util.Random

trait MpeSteps
  extends WebBrowser
    with Assertion
    with Matchers
    with ScalaDsl
    with EN
    with Browser
    with BrowserDriver {


  def userDir: String = System.getProperty("user.dir")

  def isGmpCheckerErrorPage: Boolean = driver.getTitle.startsWith("We cannot calculate a GMP")

  def fluentWait(timeOut: Int = 45, retry: Int = 500): Wait[WebDriver] = new FluentWait[WebDriver](driver)
    .withTimeout(Duration.ofSeconds(timeOut))
    .pollingEvery(Duration.ofMillis(retry))

  def waitFor(query: Query): Unit = waitFor(query.by)

  def waitFor(by: By): Unit = fluentWait().until(ExpectedConditions.presenceOfElementLocated(by))

  def waitForTitle(title: String): Unit = fluentWait().until(ExpectedConditions.titleIs(title))

  def waitForVisible(query: Query, timeOut: Int = 30): Unit = waitForVisible(query.by, timeOut)

  def waitForVisible(by: By, timeOut: Int): Unit = fluentWait(timeOut).until(ExpectedConditions.visibilityOfAllElementsLocatedBy(by))

  def browserBack(): Unit = driver.navigate().back()

  def pageRefresh(): Unit = driver.navigate().refresh()

  def continue(): Unit = click on "continue"

  def clickContinue(): Unit = find(By.id("submit")).click()

  def submit(): Unit = click on "submit"

  def clickSubmit(): Unit = find(By.id("submit")).click()

  def getElementText(query: Query): String = elementText(query.by)

  def elementText(by: By): String = find(by).getText.trim

  def find(by: By): WebElement = driver.findElement(by)

  // To set a text field with a required value
  def setTextField(query: Query, value: String): Unit = {
    clearTextField(query)
    find(query).get.underlying.sendKeys(value)
  }

  // To set a text field with a required value
  def clearTextField(query: Query): Unit = find(query).get.underlying.clear()

  def getDropDownElement(query: Query): Select = new Select(find(query).get.underlying)

  // To select a required value from the dropdown
  def selectFromDropDown(query: Query, value: String): Unit = {
    getDropDownElement(query).selectByVisibleText(value)
  }

  def clickOnLink(query: Query): Unit = click on query

  def getErrorMessages: List[String] = {
    waitFor(ClassNameQuery("govuk-error-message"))
    findElements(By.className("govuk-error-message")).asScala.map(_.getText.replaceAll("[\n]", "")).toList
  }

  def findElements(by: By): util.List[WebElement] = driver.findElements(by)

  def retryUntil(fn: WebDriver => Boolean,
                 timeoutSeconds: Int,
                 retrySeconds: Int = 2,
                 ignoring: List[Class[_ <: Throwable]] = List()): Any = {
    new FluentWait[WebDriver](driver)
      .withTimeout(Duration.ofSeconds(timeoutSeconds))
      .pollingEvery(Duration.ofSeconds(retrySeconds))
      .ignoreAll[Throwable](ignoring.asJava)
      .until((driver: WebDriver) => fn(driver))
  }

  def waitforPageText(text: String, timeout: Int = 60): Unit = {
    var loop: Int = 1
    while (!(pageSource contains text) && loop <= timeout) {
      loop = loop + 1
    }

    if (loop > timeout) Assert.fail(s"Unable to validate the text on the page : $text")
  }

  def clickOnChangeLink(link: String): Unit = {
    val id = link match {
      case "First name"                                    => "change-first-name"
      case "Last name"                                     => "change-last-name"
      case "Date of birth"                                 => "change-dob"
      case "National Insurance number"                     => "change-nino"
      case "Pension scheme administrator check reference"  => "change-pensionSchemeAdminCheckRef"
      case _ => throw new IllegalArgumentException( s"$link not present")
    }
    find(By.id(id)).click()
  }

  def generateNino(prefix: String = "AA"): String = {
    val num         = Random.nextInt(1000000)
    val suffix      = "A"
    val str: String = Random.alphanumeric.filter(_.isLetter).take(2).map(_.toUpper).mkString

    prefix + f"$str$num%06d$suffix".drop(prefix.length)
  }

  def generateTrn(prefix: String = "11"): String = {
    val num            = Random.nextInt(100000)
    val str: Char      = Random.alphanumeric.filter(_.isLetter).head.toUpper
    val prefixNum: Int = Random.nextInt(100)

    prefix + f"$prefixNum%02d$str$num%05d".drop(prefix.length)
  }

  def generateCheckRef(prefix: String = ""): String = {
    val num       = Random.nextInt(100000000)
    val str: Char = Random.alphanumeric.filter(_.isLetter).head.toUpper
    prefix + f"PSA$num%08d$str".drop(prefix.length)
  }
}
