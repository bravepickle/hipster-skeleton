#!/bin/bash
# Build new custom containers for multiple CPU architectures and push it to the Docker registry
# As an alternative to pushing to any Docker registry one can simply replace tag --push with --load to load fresh containers to the Docker host server
# Warning! This is an example and should be updated before using in production. It should serve only as an example
# See https://docs.docker.com/desktop/multi-arch/


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

set -ex

cd $BASE_DIR

docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 \
    --file etc/php/Dockerfile-php8 --tag bravepickle/php:8-fpm-alpine-dev --push .

docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 \
    --file etc/php/Dockerfile --tag bravepickle/php:7.4-fpm-alpine-dev --push .
