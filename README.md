## Download osm data files:
  - https://download.geofabrik.de
  - Example (Israel): 
    - https://download.geofabrik.de/asia/israel-and-palestine-latest.osm.pbf
    - or run the script ```download-israel-pbf.sh```

## Instructions on how to install and run osm2pgsql
- see: https://osm2pgsql.org/doc/manual.html for details.
- sudo apt update && sudo apt install osm2pgsql (can we run this in docker?)


## prepare the pos
Before you can import any OSM data into a database, you need a database.
+ connect to postgres using psql
+ run the following psql commands:
	1. create user osmuser;
	2. create database osm encoding=UTF8 owner=osmuser;
	3. CREATE EXTENSION postgis;
	4. CREATE EXTENSION hstore;

- TODO: Tuning the PostgreSQL Server (see postgresql.conf)


- Running osm2pgsql:
	osm2pgsql -c ./osm.pbf/lebanon-latest.osm.pbf -H localhost -P 5432 -U postgres

