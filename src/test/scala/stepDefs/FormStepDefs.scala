/*
 * Copyright 2024 HM Revenue & Customs
 *
 */

package stepDefs

import config.MessageReader._
import io.cucumber.datatable.DataTable

import scala.jdk.CollectionConverters._

class FormStepDefs extends MpeSteps {

  When("""^I fill in the "(.*)" field with "(.*)"$""") { (field: String, value: String) =>
    setTextField(IdQuery(field), value)
  }

  When("""^I fill in the "(.*)" comments box with "(.*)"$""") { (field: String, value: String) =>
    setTextField(IdQuery(field), value)
  }

  Then("""^I should see the following fields pre-populated with following values:$""") { (dataTable: DataTable) =>
    dataTable.asMaps(classOf[String], classOf[String]).asScala.foreach((data: java.util.Map[String, String]) => {
      data.get("type") match {
        case "text" => textField(getMessage(data.get("field"))).value shouldBe data.get("value")
        case "number" => numberField(getMessage(data.get("field"))).value shouldBe data.get("value")
        case "checkbox" => checkbox(getMessage(data.get("field"))).isSelected.toString shouldBe data.get("value")
        case "radio" => radioButton(getMessage(data.get("field"))).isSelected.toString shouldBe data.get("value")
        case "select" => singleSel(getMessage(data.get("field"))).value shouldBe data.get("value")
        case "email" => textField(getMessage(data.get("field"))).value shouldBe data.get("value")
        case "day" => numberField(getMessage(data.get("field"))).value shouldBe data.get("value")
        case "month" => numberField(getMessage(data.get("field"))).value shouldBe data.get("value")
        case "year" => numberField(getMessage(data.get("field"))).value shouldBe data.get("value")
      }
    })
  }
}