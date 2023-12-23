#!/bin/bash

function psql() {
    local POSTGRES_IMAGE="postgis"
    local POSTGRES_HOST="localhost"
    local POSTGRES_USER="postgres"
    docker exec -it ${POSTGRES_IMAGE} bash -c "psql -h ${POSTGRES_HOST} -U ${POSTGRES_USER}"
}

psql "$@"
