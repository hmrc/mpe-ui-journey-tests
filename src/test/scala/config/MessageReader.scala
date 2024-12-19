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

package config

import java.io.FileInputStream
import java.util.{Properties, PropertyResourceBundle}

object MessageReader {

  val messageResource: Properties = {
    val messagesStream = new FileInputStream("./src/test/resources/id/IdMessageFile.properties")
    val properties = new Properties()
    properties.load(messagesStream)
    properties
  }
  val messageResourceText: PropertyResourceBundle = {

    lazy val messageId = new FileInputStream("./src/test/resources/id/IdMessageFile")

    try {
      new PropertyResourceBundle(messageId)
    } finally {
      messageId.close()
    }
  }
  var scenarioLoop: Boolean = true

  def getMessage(key: String): String = messageResource.getProperty(key, key)

  def getMessageText(key: String): String = {
    val modifiedKey = key.replaceFirst("'", "").replaceAll(" +", "")
    messageResourceText.getString(modifiedKey)
  }
}

