/*
 * Copyright 2024 HM Revenue & Customs
 *
 */

package stepDefs

import scala.language.postfixOps
import scala.sys.process._

class ServiceStepDefs extends MpeSteps {

  Given("""^I drop the database""") { () =>
    "./mpe-drop-database.sh" !
  }

}
