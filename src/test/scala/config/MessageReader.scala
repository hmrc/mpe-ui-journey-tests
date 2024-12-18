/*
 * Copyright 2024 HM Revenue & Customs
 *
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
