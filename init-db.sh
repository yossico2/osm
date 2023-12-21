#!/bin/bash

function init-db() {
	docker exec postgres bash -c "psql -h localhost -U postgres -c 'create user osmuser;'"
	docker exec postgres bash -c "psql -h localhost -U postgres -c 'create database osm encoding=UTF8 owner=osmuser;'"
	docker exec postgres bash -c "psql -h localhost -U postgres -c 'CREATE EXTENSION postgis;'"
	docker exec postgres bash -c "psql -h localhost -U postgres -c 'CREATE EXTENSION hstore;'"
}

init-db "$@"

