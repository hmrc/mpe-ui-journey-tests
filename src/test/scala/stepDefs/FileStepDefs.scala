/*
 * Copyright 2024 HM Revenue & Customs
 *
 */

package stepDefs

import org.openqa.selenium.WebDriver
import org.openqa.selenium.support.ui.FluentWait

import java.io.File
import java.nio.file.{Files, Paths}
import java.time.Duration

class FileStepDefs extends MpeSteps {

  private def getLatestFile(dir: String, extension: String): File = {
    new FluentWait[WebDriver](driver)
      .withTimeout(Duration.ofSeconds(10))
      .ignoring(classOf[UnsupportedOperationException])
      .until((_: WebDriver) => {
        new File(dir).listFiles().filter { file =>
          file.getName.matches(s"""$extension""")
        } maxBy { file => file.lastModified() }
      })
  }

  Then( """^a "(.*)" file should have been downloaded with "(.*)" as the content$""") { (extension: String, content: String) =>
    val downloaded = getLatestFile(System.getProperty("java.io.tmpdir"), extension)
    val fileTemp = scala.io.Source.fromFile(downloaded)
    val fileContent = fileTemp.getLines().mkString("\n").trim
    fileTemp.close()
    val downloadResult = s"$userDir/src/test/resources/DownloadResult/$content"
    val fileSource = scala.io.Source.fromFile(downloadResult)
    val file = fileSource.getLines().mkString("\n").trim
    fileSource.close()
    assert(file == fileContent)
    downloaded.delete()
  }

  And("""I clear the "(.*)" file from temp dir""") { file: String =>
    val tmpfile = Paths.get("/tmp" + file)
    Files.deleteIfExists(tmpfile)
  }

}