/*
 * Copyright 2024 HM Revenue & Customs
 *
 */

package stepDefs

import com.typesafe.scalalogging.LazyLogging
import org.openqa.selenium.WebDriver
import uk.gov.hmrc.selenium.webdriver.Driver

trait BrowserDriver extends LazyLogging {
  logger.info(
    s"Instantiating Browser: ${sys.props.getOrElse("browser", "'browser' System property not set. This is required")}"
  )

  implicit def driver: WebDriver = Driver.instance

}
