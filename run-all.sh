#!/bin/bash

./run-postgis.sh
sleep 3.s
./init-osm-db.sh
sleep 1.s
./run-external-data.sh
sleep 1.s
./load-israel-pbf.sh
sleep 1.s
./run-map-proxy.sh

echo "open http://localhost:8080/demo"
