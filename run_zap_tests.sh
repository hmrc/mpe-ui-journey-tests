#!/bin/bash
mongo mpe --eval "db.dropDatabase()"
mongo mpe-bulk --eval "db.dropDatabase()"
BROWSER=$1
ENVIRONMENT=$2

echo " ------------  Running UI Tests in preparation for ZAP Scan --------------------------- "
sbt -Denvironment=local -Dbrowser="${BROWSER:=chrome}" -Dbrowser.option.headless=false -Dzap.proxy=true 'testOnly RunWip'
