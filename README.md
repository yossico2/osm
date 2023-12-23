## Reference
https://github.com/akadouri/osm2pgsql-docker-quickstart/blob/main/osm2pgsql/osm-importer.sh

## Download osm data files:
OSM data files can be downloaded from [osm2pgsql Manual](https://download.geofabrik.de)

	For Israel data run: download-israel-pbf.sh

## Build a docker image with osm2pgsql
```osm2pgsql``` is a the tool for importing OpenStreetMap data into a PostgreSQL database.

You can build a docker image with osm2pgsql right from here:

	cd osm2pgsql && docker build -t osm2pgsql .

See https://osm2pgsql.org/doc/manual.html for more details on osm2pgsql.


## PostgreSQL Server
In this procedure we use a clean instance of PostgreSQL Server with ```postgis``` extention running inside a docker container.

Tunning the PostgreSQL Server in a production system (see: [osm2pgsql Manual](https://download.geofabrik.de))

	Run: run-pgsql.sh


## Preparing a database
Before you can import any OSM data into a database, you need to prepare a database:
- Run ```init-db.sh```

## Running osm2pgsql
	osm2pgsql -c ./osm.pbf/lebanon-latest.osm.pbf -H localhost -P 5432 -U postgres

