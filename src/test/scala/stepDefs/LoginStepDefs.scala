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

import org.junit.Assert

class LoginStepDefs extends MpeSteps {

  val enrolment: NameQuery = NameQuery("enrolment[0].name")
  val idName: IdQuery = IdQuery("input-0-0-name")
  val idValue: IdQuery = IdQuery("input-0-0-value")

  When("""^I enter UserId as "(.*)"$""") { username: String =>
    setTextField(IdQuery("userId"), username)
  }

  When("""^I enter Password as "(.*)"$""") { password: String =>
    setTextField(IdQuery("password"), password)
  }

  And("""^I fill in the auth details for enrolment (.*) with value (.*)$""") { (enrol: String, value:String)=>
    go to "http://localhost:9949/auth-login-stub/gg-sign-in"

    setTextField(NameQuery("redirectionUrl"), "http://localhost:30029/members-protections-and-enhancements")

    enrol.trim.toUpperCase match {
      case "PSA" =>
        setTextField(enrolment, "HMRC-PODS-ORG")
        setTextField(idName, "PSAID")
      case "PSP" =>
        setTextField(enrolment, "HMRC-PODSPP-ORG")
        setTextField(idName, "PSPID")
      case _ =>
        Assert.fail(s"Wrong enrolment mentioned : $enrol")
    }

    setTextField(idValue, value)

    clickContinue()
  }

}

