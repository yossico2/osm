#!/bin/bash

function psql() {

    local POSTGRES_IMAGE="postgis"
    local POSTGRES_HOST="localhost"
    local POSTGRES_USER="postgres"

	local psql_command=
	while [[ $# -gt 0 ]]; do
	  case $1 in
		-c)
		  psql_command="${psql_command} -c '${2}'"
		  shift 2
		  ;;
		*)
		  psql_command="${psql_command} ${1}"
		  shift # past argument
		  ;;
	  esac
	done

    if [ -n "${psql_command}" ]; then
        $(docker exec ${POSTGRES_IMAGE} psql -h ${POSTGRES_HOST} -U ${POSTGRES_USER} ${psql_command})
    else
        docker exec -it ${POSTGRES_IMAGE} psql -h ${POSTGRES_HOST} -U ${POSTGRES_USER}
    fi
}

psql "$@"
