#!/bin/bash

DATADIR="osm/data"
mkdir -p ${DATADIR} && cd ${DATADIR} || exit
curl -XGET https://download.geofabrik.de/asia/israel-and-palestine-latest.osm.pbf --output israel-and-palestine-latest.osm.pbf
