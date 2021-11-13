#!/bin/bash
# Make some CURL requests to test if the application can be run

BASE_DIR="$( dirname $( cd "$( dirname "$(realpath $BASH_SOURCE)" )" && pwd ))"

if [ ! -f $BASE_DIR/.env ]; then
    echo ".env not file at path: ${BASE_DIR}"

    exit 1
fi

# automatically export all variables from .env file
set -a
source $BASE_DIR/.env
set +a

echo BASE_DIR $BASE_DIR

set -e

cd $BASE_DIR

echo ""
echo "==============  Test if Traefik Dashboard works. Expecting to return 200 status code..."
curl -I 'localhost:8080/dashboard/'
echo ""

echo ""
echo "==============  Test if Traefik API is enabled and works. Expecting to return 200 status code and JSON code..."
curl -i 'localhost:8080/api/rawdata'
echo ""

echo ""
echo "==============  Test if routing to whoami server works. Expecting to return 200 status code with headers info..."
curl -i localhost:80/whoami/test
echo ""

echo ""
echo "==============  Test if routing to web server works. Expecting to return 200 status code with headers info..."
curl -i localhost:80/server.php
echo ""
