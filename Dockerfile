# howgood/postgres

FROM postgres:9.4

ENV GIS_VERSION 2.1

# Update sources, and install dependencies
RUN apt-get update && \
    apt-get install -y \
          postgresql-$PG_MAJOR-postgis-$GIS_VERSION \
          postgresql-contrib-$PG_MAJOR && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    apt-get autoremove

# Defaults
ENV PGUSER super_user
ENV PGPASSWORD super_user
ENV PGDATABASE super_user
ENV PGEXTENSIONS hstore postgis postgis_topology pg_trgm fuzzystrmatch

COPY ./custom.postgresql.conf /
COPY ./docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["postgres"]
