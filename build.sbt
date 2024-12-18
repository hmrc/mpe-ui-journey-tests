lazy val testSuite = (project in file("."))
  .settings(
    name := "mpe-ui-journey-tests",
    version := "1.0.0",
    scalaVersion := "2.13.12",
    scalacOptions ++= Seq("-unchecked", "-deprecation", "-feature"),
    libraryDependencies ++= Dependencies.test,
    Test / testOptions := Seq.empty
  )
