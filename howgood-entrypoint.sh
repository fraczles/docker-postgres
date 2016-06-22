#!/bin/bash
#
# This script wraps /docker-entrypoint.sh in order to rename default postgres
# connection variables to the format that docker-entrypoint prefers them in.
#
##

set -e


if [ "$1" == "postgres" ] ; then
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

exec /docker-entrypoint.sh "$@"
