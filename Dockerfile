# howgood/postgres:testing

FROM howgood/postgres:latest

COPY 10-add-to-conf.sh /docker-entrypoint-initdb.d/10-add-to-conf.sh
