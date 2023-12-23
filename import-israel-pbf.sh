#!/bin/bash

OSM2PGSQL_IMAGE="osm2pgsql"
DATADIR="osm/data"
PBF="data/israel-and-palestine-latest.osm.pbf"
PGSQL_HOST="localhost"
PGSQL_USERNAME="postgres"

docker run --network=host \
    -v "${PWD}/${DATADIR}:/osm/data" \
    ${OSM2PGSQL_IMAGE} osm2pgsql \
    -H ${PGSQL_HOST} -P 5432 -U ${PGSQL_USERNAME} \
    -c ${PBF}
