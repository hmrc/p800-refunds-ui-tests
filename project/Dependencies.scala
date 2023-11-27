import sbt._

object Dependencies {

  val test = Seq(
    "com.typesafe"         % "config"            % "1.4.3"    % Test,
    "com.vladsch.flexmark" % "flexmark-all"      % "0.62.2"   % Test,
    "org.scalatest"       %% "scalatest"         % "3.2.17"   % Test,
    "org.scalatestplus"   %% "selenium-4-12"     % "3.2.17.0" % Test,
    "io.cucumber"         %% "cucumber-scala"    % "8.18.1"   % Test,
    "io.cucumber"          % "cucumber-junit"    % "7.14.1"   % Test,
    "junit"                % "junit"             % "4.13.2"   % Test,
    "com.novocode"         % "junit-interface"   % "0.11"     % Test,
    "uk.gov.hmrc"         %% "webdriver-factory" % "0.46.0"   % Test
  )

}
