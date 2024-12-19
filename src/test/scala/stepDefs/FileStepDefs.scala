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
