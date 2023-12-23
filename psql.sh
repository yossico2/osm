#!/bin/bash

function psql() {

    local POSTGRES_IMAGE="postgis"
    local POSTGRES_HOST="localhost"
    local POSTGRES_USER="postgres"
    local OSM_DB="osm"

    if [ $# -gt 0 ]; then
        docker exec ${POSTGRES_IMAGE} bash -c "psql -h ${POSTGRES_HOST} -U ${POSTGRES_USER} -d ${OSM_DB} -c '$*'"
    else
        docker exec -it ${POSTGRES_IMAGE} bash -c "psql -h ${POSTGRES_HOST} -U ${POSTGRES_USER} -d ${OSM_DB}"
    fi
}

psql "$@"
