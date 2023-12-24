#!/bin/bash

function init-db() {
	local POSTGRES_IMAGE="postgis"
	local POSTGRES_HOST="localhost"
	local POSTGRES_USER="postgres"
	local OSM_USER="osmuser"
	local OSM_DB="osm"
	
	docker exec ${POSTGRES_IMAGE} bash -c "psql -h ${POSTGRES_HOST} -U ${POSTGRES_USER} -d ${OSM_DB} -c 'ALTER SYSTEM SET jit=off;'"
	docker exec ${POSTGRES_IMAGE} bash -c "psql -h ${POSTGRES_HOST} -U ${POSTGRES_USER} -d ${OSM_DB} -c 'SELECT pg_reload_conf();'"
}

init-db "$@"
