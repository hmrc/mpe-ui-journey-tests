lazy val root = (project in file("."))
  .settings(
    name := "mpe-ui-journey-tests",
    version := "1.0.0",
    scalaVersion := "2.13.16",
    scalacOptions ++= Seq("-unchecked", "-deprecation", "-feature"),
    libraryDependencies ++= Dependencies.test,
    Test / testOptions := Seq.empty
  )
