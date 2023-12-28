#!/bin/bash

function postgis() {

	local POSTGRES_IMAGE="postgis/postgis"
	local NETWORK=host
	local POSTGIS_CONTAINER_NAME=postgis
	local POSTGRES_USER=postgres
	local POSTGRES_PASSWORD=postgres

	docker run -d --name ${POSTGIS_CONTAINER_NAME} --network=${NETWORK} \
		-e POSTGRES_USER=${POSTGRES_USER} \
		-e POSTGRES_PASSWORD=${POSTGRES_PASSWORD} \
		${POSTGRES_IMAGE} \
		-c "shared_buffers=1GB" \
		-c "work_mem=50MB" \
		-c "maintenance_work_mem=4GB" \
		-c "autovacuum_work_mem=1GB" \
		-c "wal_level=minimal" \
		-c "checkpoint_timeout=60min" \
		-c "max_wal_size=4GB" \
		-c "checkpoint_completion_target=0.9" \
		-c "max_wal_senders=0" \
		-c "random_page_cost=1.0"
}

postgis "$@"
