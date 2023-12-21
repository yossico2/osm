#!/bin/bash

function run-pgsql() {
	local IMAGE="postgis/postgis"
	docker run -d --name postgres --network=host -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres ${IMAGE}
}

run-pgsql "$@"

