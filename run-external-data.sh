#!/bin/bash

function run-mapproxy-mapnik() {
    local EXTERNAL_DATA_IMAGE="external-data"
    local PGSQL_HOST="localhost"
    local POSTGRES_USER="postgres"
    local POSTGRES_PASSWORD="postgres"
    local OSM_DB="osm"

    docker run --rm --network=host \
        -e PGPASSWORD=${POSTGRES_PASSWORD} \
        ${EXTERNAL_DATA_IMAGE} \
        --no-update \
        --host ${PGSQL_HOST} \
        --database ${OSM_DB} \
        --username ${POSTGRES_USER}
}

run-mapproxy-mapnik "$@"
