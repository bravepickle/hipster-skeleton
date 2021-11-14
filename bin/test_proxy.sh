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

CL_GREEN=`tput setaf 2`
CL_RESET=`tput sgr0`

run_cmd() {
    echo -e "${CL_GREEN}=> ${@}${CL_RESET}"
    echo ""
    $@
}

echo BASE_DIR $BASE_DIR

set -e

cd $BASE_DIR

echo ""
echo "==============  Test if Traefik Dashboard works. Expecting to return 200 status code..."
run_cmd curl -I 'localhost:8080/dashboard/'
echo ""

echo ""
echo "==============  Test if Traefik API is enabled and works. Expecting to return 200 status code and JSON code..."
run_cmd curl -i 'localhost:8080/api/rawdata'
echo ""

echo ""
echo "==============  Test if routing to whoami server works. Expecting to return 200 status code with headers info..."
run_cmd curl -i -L --insecure http://localhost/whoami/test
echo ""

echo ""
echo "==============  Test if routing to web server + PHP works. Expecting to return 200 status code with headers info..."
run_cmd curl -i -L --insecure http://localhost/server.php
echo ""

echo ""
echo "==============  Test if routing to web server + PHP8 works. Expecting to return 200 status code with headers info..."
run_cmd curl -i -L --insecure https://localhost/server.php8
echo ""

