## Reference
https://github.com/akadouri/osm2pgsql-docker-quickstart/blob/main/osm2pgsql/osm-importer.sh

## Download osm data files:
OSM data files can be downloaded from [geofabrik.de](https://download.geofabrik.de).

To download Israel OSM data run:

	download-israel-pbf.sh

## Build a docker image with osm2pgsql
```osm2pgsql``` is a the tool for importing OpenStreetMap data into a PostgreSQL database.

You can build a docker image with osm2pgsql right from here:

	cd osm2pgsql && docker build -t osm2pgsql .

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
