#!/bin/bash

set -e

function pg_cmd {
  psql -qe -U postgres -d template1 -c "${1}"
}

function setup {
  while [[ ! -e /tmp/postgresql.pid ]]; do
    sleep 1
  done

  for extension in $PGEXTENSIONS; do
    pg_cmd "CREATE EXTENSION ${extension};"
  done
  pg_cmd "CREATE USER ${PGUSER} WITH SUPERUSER ENCRYPTED PASSWORD '${PGPASSWORD}';"
  pg_cmd "CREATE DATABASE ${PGDATABASE} TEMPLATE template1 OWNER ${PGUSER};"
}

if [[ "$1" == 'postgres' ]]; then
  chown -R postgres "$PGDATA"

  if [[ -z "$(ls -A "$PGDATA")" ]]; then
    gosu postgres initdb

    cat /custom.postgresql.conf >> "$PGDATA/postgresql.conf"
    rm /custom.postgresql.conf

    { echo; echo 'host all all 0.0.0.0/0 trust'; } >> "$PGDATA"/pg_hba.conf

    setup &
  fi

  exec gosu postgres "$@"
fi

exec "$@"
