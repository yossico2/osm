#!/bin/bash

function init-db() {
	local POSTGIS_CONTAINER_NAME=postgis
	local POSTGRES_HOST=localhost
	local POSTGRES_USER=postgres
	# local OSM_USER=osmuser
	local OSM_USER=postgres
	local OSM_DB=osm

	docker exec ${POSTGIS_CONTAINER_NAME} bash -c "psql -h ${POSTGRES_HOST} -U ${POSTGRES_USER} -c 'create user ${OSM_USER};'"
	docker exec ${POSTGIS_CONTAINER_NAME} bash -c "psql -h ${POSTGRES_HOST} -U ${POSTGRES_USER} -c 'create database ${OSM_DB} encoding=UTF8 owner=${OSM_USER};'"
	docker exec ${POSTGIS_CONTAINER_NAME} bash -c "psql -h ${POSTGRES_HOST} -U ${POSTGRES_USER} -d ${OSM_DB} -c 'CREATE EXTENSION postgis;'"
	docker exec ${POSTGIS_CONTAINER_NAME} bash -c "psql -h ${POSTGRES_HOST} -U ${POSTGRES_USER} -d ${OSM_DB} -c 'CREATE EXTENSION hstore;'"
}

init-db "$@"
