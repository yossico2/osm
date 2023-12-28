#!/bin/bash

./run-postgis.sh
./init-osm-db.sh
./run-external-data.sh
./load-israel-pbf.sh
./run-map-proxy.sh

echo "open http://localhost:8080/demo"
