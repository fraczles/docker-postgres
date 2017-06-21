#!/bin/sh
#
# This script wraps docker-entrypoint.sh in order to rename default postgres
# connection variables to the format that docker-entrypoint prefers them in.
#
##

set -e


if [ "$1" == "postgres" ] ; then
  [[ -z "$POSTGRES_USER" ]] && export POSTGRES_USER="${PGUSER:-postgres}"
  [[ -z "$POSTGRES_DB" ]] && export POSTGRES_DB="${PGDATABASE}"
  [[ -z "$POSTGRES_PASSWORD" ]] && export POSTGRES_PASSWORD="${PGPASSWORD}"

  export POSTGRES_USER="${PGUSER:-postgres}"
  export POSTGRES_DB="${PGDATABASE:-${POSTGRES_USER}}"

  if [ "$PGPASSWORD" ] ; then
    export POSTGRES_PASSWORD="${PGPASSWORD:-postgres}"
    unset PGPASSWORD
  fi

  unset PGUSER
  unset PGDATABASE
  unset PGHOST
fi

exec docker-entrypoint.sh "$@"
