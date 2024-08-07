import sbt._

object Dependencies {

  val test = Seq(
    "com.typesafe"         % "config"             % "1.4.3"    % Test,
    "com.vladsch.flexmark" % "flexmark-all"       % "0.62.2"   % Test,
    "org.scalatest"       %% "scalatest"          % "3.2.19"   % Test,
    "org.scalatestplus"   %% "selenium-4-12"      % "3.2.17.0" % Test,
    "io.cucumber"         %% "cucumber-scala"     % "8.23.1"   % Test,
    "io.cucumber"          % "cucumber-junit"     % "7.18.1"   % Test,
    "junit"                % "junit"              % "4.13.2"   % Test,
    "com.novocode"         % "junit-interface"    % "0.11"     % Test,
    "org.mongodb.scala"   %% "mongo-scala-driver" % "5.1.2"    % Test,
    "uk.gov.hmrc"         %% "ui-test-runner"     % "0.33.0"   % Test
  )

}
