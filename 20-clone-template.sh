#!/bin/bash

set -e


# Create all of the extensions on template1
for extension in $POSTGRES_EXTENSIONS; do
  psql \
    --echo-queries \
    --set ON_ERROR_STOP=1 \
    --username "$POSTGRES_USER" \
    --dbname template1 \
    --command \
      "CREATE EXTENSION $extension ;"
done
