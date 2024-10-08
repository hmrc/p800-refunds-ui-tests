#!/bin/bash -e
DEFAULT_BROWSER=firefox
BROWSER_TYPE=$1
ENV=$2

if [ -z "$BROWSER_TYPE" ]; then
    echo "BROWSER_TYPE value not set, defaulting to $DEFAULT_BROWSER..."
    echo ""
fi

sbt clean -Dbrowser="${BROWSER_TYPE:=$DEFAULT_BROWSER}" -Denvironment="${ENV:=local}" "testOnly uk.gov.hmrc.test.ui.cucumber.runner.TestRunner" testReport
