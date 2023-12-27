## Download osm data files:
OSM data files can be downloaded from [geofabrik.de](https://download.geofabrik.de).

To download Israel OSM data run:

	download-israel-pbf.sh

## Build a docker image with osm2pgsql
```osm2pgsql``` is a the tool for importing OpenStreetMap data into a PostgreSQL database.

You can build a docker image with osm2pgsql right from here:

	./docker-build-osm2pgsql.sh

See [osm2pgsql Manual](https://osm2pgsql.org/doc/manual.html) for more details on osm2pgsql.

## PostgreSQL Server
In this procedure we use a clean instance of PostgreSQL Server with ```postgis``` extention running inside a docker container.

Run the following script to start the container:

	postgis.sh

See the [this](https://osm2pgsql.org/doc/manual.html#tuning-the-postgresql-server) for details on tunning the PostgreSQL Server in a production system.

## Preparing a database
Before you can import any OSM data into a database, you need to prepare a database.

Run the following script to prepare a database:

	init-db.sh

## Running osm2pgsql
Run the following script to import ```israel-and-palestine-latest.osm.pbf``` into the PostgreSQL Server:

	import-israel-pbf.sh

## Updating data
TBD

## mapproxy-mapnik
Pull mapproxy-mapnik from git:

	git pull https://github.com/MapColonies/mapproxy-mapnik/tree/docs-imrovement

This repository contains A docker image with [MapProxy](https://github.com/mapproxy/mapproxy) and [Mapnik](https://github.com/mapnik/mapnik) compiled to facilitate rendering of OSM carto style. The style itself can be found in this [repo](https://github.com/MapColonies/openstreetmap-carto).

### Building the images
Build the external data image:
   
	./docker-build-external-data.sh

Build the mapproxy image:

	./docker-build-mapproxy.sh


## Reference
1. Geofabrik OSM Download Server: https://download.geofabrik.de/europe/denmark.html
2. Upload to PostgreSQL DB: MapColonies/osm2pgsql: https://github.com/MapColonies/osm2pgsql
3. OSM rendering style: https://github.com/MapColonies/openstreetmap-carto/tree/flex/master
4. OSM rendering: https://github.com/MapColonies/mapproxy-mapnik/tree/docs-imrovement
- OSM Importer: https://github.com/akadouri/osm2pgsql-docker-quickstart/blob/main/osm2pgsql/osm-importer.sh