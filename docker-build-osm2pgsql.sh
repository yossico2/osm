#!/bin/bash

docker build -t osm2pgsql \
	--file=osm2pgsql/Dockerfile \
	osm2pgsql/.
