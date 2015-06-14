# howgood/postgresql:testing

FROM howgood/postgres:latest
COPY ./custom.postgresql.conf /
