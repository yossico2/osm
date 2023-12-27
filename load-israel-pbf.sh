#!/bin/bash

function import-pbf() {
    local OSM2PGSQL_IMAGE="osm2pgsql"
    local DATADIR="osm/data"
    local PBF="data/israel-and-palestine-latest.osm.pbf"
    local PGSQL_HOST="localhost"
    local POSTGRES_USER="postgres"
    local OSM_DB="osm"

    docker run --rm --network=host \
        -v "${PWD}/${DATADIR}:/osm/data" \
        -v "${PWD}/custom.style:/osm/custom.style" \
        ${OSM2PGSQL_IMAGE} osm2pgsql \
        -H ${PGSQL_HOST} -P 5432 -U ${POSTGRES_USER} \
        --database ${OSM_DB} \
        --style custom.style \
        -c ${PBF}
}

import-pbf "$@"
