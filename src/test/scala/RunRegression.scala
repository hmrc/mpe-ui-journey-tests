/*
 * Copyright 2024 HM Revenue & Customs
 *
 */

import io.cucumber.junit.{Cucumber, CucumberOptions}
import org.junit.runner.RunWith
import stepDefs.MpeSteps

@RunWith(classOf[Cucumber])
@CucumberOptions(
  features = Array("src/test/resources/features"),
  glue = Array("stepDefs"),
  plugin = Array("pretty", "html:target/cucumber", "json:target/cucumber.json"),
  tags = "@regression_local"
)
class RunRegression extends MpeSteps {
  After {
    quitBrowser()
  }
}
