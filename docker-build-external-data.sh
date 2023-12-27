#!/bin/bash

docker build -t external-data \
	--file=mapproxy-mapnik/external-data/Dockerfile \
	mapproxy-mapnik/external-data/.
