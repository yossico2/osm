#!/bin/bash

function init-db() {
	local POSTGRES_IMAGE="postgis"
	local POSTGRES_HOST="localhost"
	local POSTGRES_USER="postgres"
	docker exec ${POSTGRES_IMAGE} bash -c "psql -h ${POSTGRES_HOST} -U ${POSTGRES_USER} -c 'create user osmuser;'"
	docker exec ${POSTGRES_IMAGE} bash -c "psql -h ${POSTGRES_HOST} -U ${POSTGRES_USER} -c 'create database osm encoding=UTF8 owner=osmuser;'"
	docker exec ${POSTGRES_IMAGE} bash -c "psql -h ${POSTGRES_HOST} -U ${POSTGRES_USER} -c 'CREATE EXTENSION postgis;'"
	docker exec ${POSTGRES_IMAGE} bash -c "psql -h ${POSTGRES_HOST} -U ${POSTGRES_USER} -c 'CREATE EXTENSION hstore;'"
}

init-db "$@"
