#!/bin/bash

function import-pbf() {
    local OSM2PGSQL_IMAGE="osm2pgsql"
    local NETWORK=host
    local DATADIR="osm/data"
    local PBF="data/israel-and-palestine-latest.osm.pbf"
    local PGSQL_HOST=localhost
    local POSTGRES_USER=postgres
    local OSM_DB=osm

    local STYLE_VOUME_MAPPING="${PWD}/mapproxy-mapnik/openstreetmap.lua:/osm/openstreetmap.lua"
    local STYLE="openstreetmap.lua"
    # local STYLE_VOUME_MAPPING="${PWD}/custom.style:/osm/custom.style"
    # local STYLE="custom.style"
    docker run --rm --network=${NETWORK} \
        -v "${PWD}/${DATADIR}:/osm/data" \
        -v "${STYLE_VOUME_MAPPING}" \
        ${OSM2PGSQL_IMAGE} osm2pgsql \
        -H ${PGSQL_HOST} -P 5432 -U ${POSTGRES_USER} \
        --database ${OSM_DB} \
        --style "${STYLE}" \
        --output=flex \
        -c ${PBF}
}

import-pbf "$@"
