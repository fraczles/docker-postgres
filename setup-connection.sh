#!/usr/bin/env bash

cat > "$PGSERVICEFILE" <<EOF
[${PGSERVICE}]
host=${POSTGRES_HOST}
port=5432
user=${POSTGRES_USER}
EOF
