# howgood/postgres

FROM postgres:9.4

ENV GIS_VERSION 2.1

# Update sources, and install dependencies
RUN apt-get update && \
    apt-get install -y \
          postgresql-$PG_MAJOR-postgis-$GIS_VERSION \
          postgresql-contrib-$PG_MAJOR && \
    rm -Rf /var/lib/apt/lists/* && \
    apt-get clean && \
    apt-get autoremove

COPY setup-db.sh /docker-entrypoint-initdb.d/setup-db.sh

# Default extensions
ENV POSTGRES_EXTENSIONS hstore postgis postgis_topology pg_trgm fuzzystrmatch
