#!/bin/bash -e

BROWSER=$1
ENVIRONMENT=$2

sbt clean -Dbrowser="${BROWSER:=chrome}" -Dbrowser.option.headless=true -Denvironment="${ENVIRONMENT:=local}" "testOnly RunAcceptance" testReport
