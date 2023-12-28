#!/bin/bash

function run-mapproxy-mapnik() {
    local MAPPROXY_MAPNIK_IMAGE="mapproxy-mapnik"
    local NETWORK=host
    local PGSQL_HOST=localhost
    local POSTGRES_USER=postgres
    local POSTGRES_PASSWORD=postgres
    local OSM_DB=osm

    docker run --rm --network=${NETWORK} \
        -e PGHOST=${PGSQL_HOST} \
        -e PGDATABASE=${OSM_DB} \
        -e PGUSER=${POSTGRES_USER} \
        -e PGPASSWORD=${POSTGRES_PASSWORD} \
        -e PRODUCTION=false \
        ${MAPPROXY_MAPNIK_IMAGE}
}

run-mapproxy-mapnik "$@"
