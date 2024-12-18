/*
 * Copyright 2024 HM Revenue & Customs
 *
 */

package stepDefs

import config.MessageReader._
import io.cucumber.datatable.DataTable
import org.openqa.selenium.support.ui.ExpectedConditions
import org.openqa.selenium.{By, JavascriptExecutor, NoSuchElementException}
import play.libs.Scala.asScala

import java.time.LocalDate
import java.time.format.DateTimeFormatter
import java.util
import scala.jdk.CollectionConverters._

class PageStepDefs extends MpeSteps {

  val upload:XPathQuery = XPathQuery("//*[@id=\"upload-button\"]")

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
    if(title.contains("Give feedback") || title.contains("Member Pension Enhancement (MPE) checker")) {
      waitForTitle(s"$title - GOV.UK")
    } else {
      waitForTitle(s"$title - Member Pension Enhancement (MPE) checker - GOV.UK")
    }
  }

  Then("""^I should be on the page "(.*)"""") { title: String =>
      waitForTitle(title)
  }

  Then("""^I should be on a MPE checker error page""") { () =>
    isGmpCheckerErrorPage should equal(true)
  }

  Then("""^I should see the following data in the "(.*)" table:$""") { (name: String, dataTable: DataTable) =>
    val scalaDataTableList: List[List[String]] = asScala(dataTable.asLists(classOf[String])).toList.asInstanceOf[List[util.List[String]]].map(dataList => asScala(dataList).toList)
    var expectedTextFromTable: String = scalaDataTableList.map((data: List[String]) => {
      data.filter(_ !=null).mkString(" ")
    }).mkString("\n")
    name match {
      case "Member details"                            |
           "Member details - position 2"               |
           "Member details - not revalued"             |
           "Member details - cannot calculate"         |
           "Member details - with post-1990"           |
           "Member details - cont & earnings"             => expectedTextFromTable = s"Scheme member details\n$expectedTextFromTable"
      case "Deceased Member details"                   |
           "Deceased Member details - cannot calculate"   => expectedTextFromTable = s"Deceased member’s entered details\n$expectedTextFromTable"
      case "Post-1990"                                    => expectedTextFromTable = s"Post-1990 value\n$expectedTextFromTable"
      case _ => ()
    }

    val actualTextFromTable = name match {
      case "GMP Periods"                                |
           "Contracted out 1"                             => getElementText(XPathQuery("//*[@id=\"main-content\"]/div/div/table[1]"))
      case "Member details"                               => getElementText(IdQuery("member-details-table"))
      case "Member details - position 2"                |
           "Member details - not revalued"              |
           "Deceased Member details"                      => getElementText(IdQuery("member-details-table"))
      case "Post-1990"                                  |
           "Contracted out 2"                             => getElementText(XPathQuery("//*[@id=\"main-content\"]/div/div/table[2]"))
      case "Member details - cannot calculate"          |
           "Deceased Member details - cannot calculate"   => getElementText(IdQuery("member-details-table"))
      case "Member details - with post-1990"            |
           "Member details - cont & earnings"             => getElementText(IdQuery("member-details-table"))
      case default                                        => getElementText(IdQuery(getMessageText(default)))
    }
    actualTextFromTable.filterNot(_.isWhitespace) should equal(expectedTextFromTable.filterNot(_.isWhitespace))
  }

  Then("""^I should see the following data in the "(.*)" bulk table:$""") { (name: String, dataTable: DataTable) =>
    val datePattern = """(-?[0-9]+) (days?|weeks?|months?|years?)""".r
    val scalaDataTableList: List[List[String]] = asScala(dataTable.asLists(classOf[String])).toList.asInstanceOf[List[util.List[String]]].map(dataList => asScala(dataList).toList)
    val expectedTextFromTable = scalaDataTableList.map {
      row: List[String] =>
        row.filter(_ != null).map {
          case x: String if x.startsWith("^") =>
            val datePattern(count, _) = x.tail
            LocalDate.now().plusDays(count.toInt).format(DateTimeFormatter.ofPattern("dd MMMM yyyy"))
          case x => x
        }.mkString(" ")
    }.mkString("\n")
    waitForVisible(By.id("previous-calculations-table"), 300)
    val actualTextFromTable = getElementText(IdQuery("previous-calculations-table"))
    actualTextFromTable.trim() should equal(expectedTextFromTable.trim())
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

  Then("""^I should see "(.*)" on the page$""") { text: String =>
    getElementText(TagNameQuery("body")) should include(text)
  }

  And("""^I assert the value of "(.*)" is "(.*)"$""") { (field: String, value: String) =>
    val path = field match {
      case "Revaluation rate chosen"                      => "//*[@id=\"revaluation-rate-chosen\"]"
      case "Scheme Member details"                      |
           "Deceased Member details"                      => "//*[@id=\"member-details-table\"]/caption"
      case "Post-1990 header"                             => "//*[@id=\"dual-results-table\"]/caption"
      case "Contracted-out header 1"                      => "//*[@id=\"main-content\"]/div/div/table[2]/caption"
      case "Member details header"                        => "//*[@id=\"member-details-table\"]/caption"
      case "Revaluation rate"                             => "//*[@id=\"revaluation-rate-chosen\"]"
      case "Contracted-out header"                        => "//*[@id=\"contracted-out-table\"]/caption"
      case "Not inflation-proofed"                        => "//*[@id=\"survivor-header\"]"
      case "Member details - cannot calculate"          |
           "Deceased Member details - cannot calculate"   => "//*[@id=\"member-details-table\"]/caption"
      case "Scheme member details - with post-1990"     |
           "Scheme member details - cont & earnings"      => "//*[@id=\"member-details-table\"]/caption"
      case "Calculation ready"                            => "//h1"
      case "Error reason"                                 => "//*[@id=\"main-content\"]/div/div"
      case "No GMP available"                             => "//*[@id=\"main-content\"]/div/div/div[1]"
      case "Problem reason"                               => "//*[@id=\"main-content\"]/div/div/p[1]"
      case _                                              => s"//*[contains(@id,'$field')]"
    }
    getElementText(XPathQuery(path)) should include(value)
  }


  And("""^I upload the file successfully$""") {
    try {
      clickOnLink(upload)
      waitForTitle("Scanning uploaded file (this should take less than a minute) - Guaranteed Minimum Pension (GMP) checker - GOV.UK")
    }
    catch {
      case _: org.openqa.selenium.TimeoutException =>
        goBack()
        clickOnLink(upload)
        waitForTitle("Scanning uploaded file (this should take less than a minute) - Guaranteed Minimum Pension (GMP) checker - GOV.UK")
    }

    waitforPageText("Your file has been successfully uploaded")
    clickOnLink(LinkTextQuery("Continue"))
  }

  And("""^I validate file upload failed with message "(.*)"$""") { text: String =>
    clickOnLink(upload)
    waitForTitle("Scanning uploaded file (this should take less than a minute) - Guaranteed Minimum Pension (GMP) checker - GOV.UK")
    waitforPageText(text)
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

}