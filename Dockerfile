# howgood/postgres:testing

FROM howgood/postgres:latest

COPY 20-add-to-conf.sh /docker-entrypoint-initdb.d/20-add-to-conf.sh
