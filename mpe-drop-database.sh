#!/bin/bash
export PATH="$PATH:/usr/local/opt/mongodb-community@3.6/bin"
mongo gmp-bulk --eval 'db["bulk-calculation"].remove({})'
mongo gmp-bulk --eval 'db["locks"].remove({})'