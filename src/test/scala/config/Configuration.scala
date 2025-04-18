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

case class Configuration(link: String)

object Configuration {

  lazy val environment: Environment.Name = {
    val environmentProperty = System.getProperty("environment", "local").toLowerCase
    environmentProperty match {
      case "local" => Environment.Local
      case "dev" => Environment.dev
      case "staging" => Environment.Staging
      case _ => throw new IllegalArgumentException(s"Environment '$environmentProperty' not known")
    }

  }
  lazy val settings: Configuration = create()
  val baseUrl = "members-protections-and-enhancements"

  private def create(): Configuration = {
    environment match {
      case Environment.dev => new Configuration(link = "https://www.development.tax.service.gov.uk")
      case Environment.Local => new Configuration(link = "http://localhost:30029")
      case Environment.Staging => new Configuration(link = "https://www.staging.tax.service.gov.uk")
      case _ => throw new IllegalArgumentException(s"Environment '$environment' not known")
    }
  }
}

object Environment extends Enumeration {
  type Name = Value
  val Local, dev, Qa, Staging = Value
}

object GovernmentGateway extends Enumeration {
  type Name = Value
  val Local, ISV, REF, DR, Prod = Value

  def forEnvironment(env: Environment.Name): GovernmentGateway.Name = {
    env match {
      case Environment.Local => Local
      case Environment.dev => ISV
      case Environment.Staging => REF
      case _ => throw new IllegalArgumentException(s"No gateway configuration for environment: '$env'")
    }
  }
}
