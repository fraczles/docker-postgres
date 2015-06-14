# howgood/postgres:testing

FROM howgood/postgres:latest
COPY ./custom.postgresql.conf /
