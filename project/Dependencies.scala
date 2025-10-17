import sbt.*

object Dependencies {

  val test: Seq[ModuleID] = Seq(
    "uk.gov.hmrc"       %% "ui-test-runner" % "0.50.0",
    "org.scalatestplus" %% "selenium-4-21"   % "3.2.19.0",
    "io.cucumber"       %% "cucumber-scala" % "8.31.0",
    "io.cucumber"        % "cucumber-junit" % "7.30.0",
    "org.playframework" %% "play-test"      % "3.0.8" exclude("ch.qos.logback", "logback-classic")
  )

}
