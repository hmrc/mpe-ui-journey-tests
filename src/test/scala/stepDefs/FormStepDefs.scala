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
