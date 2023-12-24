#!/bin/bash

function init-db() {
	local POSTGRES_IMAGE="postgis"
	local POSTGRES_HOST="localhost"
	local POSTGRES_USER="postgres"
	local OSM_USER="osmuser"
	local OSM_DB="osm"
	
	docker exec ${POSTGRES_IMAGE} bash -c "psql -h ${POSTGRES_HOST} -U ${POSTGRES_USER} -c 'create user osmuser;'"
	docker exec ${POSTGRES_IMAGE} bash -c "psql -h ${POSTGRES_HOST} -U ${POSTGRES_USER} -c 'create database ${OSM_DB} encoding=UTF8 owner=${OSM_USER};'"
	docker exec ${POSTGRES_IMAGE} bash -c "psql -h ${POSTGRES_HOST} -U ${POSTGRES_USER} -d ${OSM_DB} -c 'CREATE EXTENSION postgis;'"
	docker exec ${POSTGRES_IMAGE} bash -c "psql -h ${POSTGRES_HOST} -U ${POSTGRES_USER} -d ${OSM_DB} -c 'CREATE EXTENSION hstore;'"
}

init-db "$@"
