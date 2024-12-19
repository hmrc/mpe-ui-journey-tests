#!/bin/bash

set +e
sm --cleanlogs

function printExceptionsFromLog {
    echo "Printing log exception for:" $1

    sm --logs $1 | grep -i '^[[:space:]]*at' --before-context=7
}

printExceptionsFromLog ASSETS_FRONTEND
printExceptionsFromLog ATTACHMENTS
printExceptionsFromLog AUTH
printExceptionsFromLog AUTHENTICATOR
printExceptionsFromLog MPE
printExceptionsFromLog MPE_FRONTEND
printExceptionsFromLog MPE_STUBS
printExceptionsFromLog CA_FRONTEND
printExceptionsFromLog CONTACT_FRONTEND
printExceptionsFromLog DATASTREAM
printExceptionsFromLog GG
printExceptionsFromLog GG_STUBS
printExceptionsFromLog KEYSTORE
printExceptionsFromLog MONGO
printExceptionsFromLog YTA_STUBS
printExceptionsFromLog MPE_BULK
printExceptionsFromLog HODSAPI
