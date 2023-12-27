#!/bin/bash

docker build -t mapproxy-mapnik \
	--file=mapproxy-mapnik/Dockerfile \
	mapproxy-mapnik/.
