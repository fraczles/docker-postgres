# howgood/postgres:9.6-alpine

FROM mdillon/postgis:9.6-alpine

ENV PGSERVICEFILE="${HOME}/.pg_service.conf" \
    PGSERVICE='howgood'


# Make sure the postgis init runs first
RUN cd /docker-entrypoint-initdb.d \
    && mv postgis.sh 00-postgis.sh

COPY initdb-howgood.sh /docker-entrypoint-initdb.d/10-howgood.sh
COPY setup-connection.sh /docker-entrypoint-initdb.d/99-connection.sh
