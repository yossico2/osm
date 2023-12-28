#!/bin/bash

function psql() {

    local POSTGIS_CONTAINER_NAME=postgis
    local POSTGRES_HOST=localhost
    local POSTGRES_USER=postgres
    local OSM_DB=osm

    if [ $# -gt 0 ]; then
        docker exec ${POSTGIS_CONTAINER_NAME} bash -c "psql -h ${POSTGRES_HOST} -U ${POSTGRES_USER} -d ${OSM_DB} -c '$*'"
    else
        docker exec -it ${POSTGIS_CONTAINER_NAME} bash -c "psql -h ${POSTGRES_HOST} -U ${POSTGRES_USER} -d ${OSM_DB}"
    fi
}

psql "$@"
