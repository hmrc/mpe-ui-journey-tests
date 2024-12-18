import sbt._

object Dependencies {

  val test: Seq[ModuleID] = Seq(
    "uk.gov.hmrc"       %% "ui-test-runner" % "0.38.0",
    "org.scalatestplus" %% "selenium-4-21"   % "3.2.19.0",
    "io.cucumber"       %% "cucumber-scala" % "8.23.1",
    "io.cucumber"        % "cucumber-junit" % "7.18.1",
    "org.playframework" %% "play-test"      % "3.0.4" exclude("ch.qos.logback", "logback-classic")
  )

}