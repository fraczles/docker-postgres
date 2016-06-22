#!/bin/bash

set -e


cat >> "$PGDATA/postgresql.conf" <<EOS

# - howgood/postgres:testing - #
# - : speed up for testing

fsync = 'off'
full_page_writes = 'off'
checkpoint_segments = '100'
checkpoint_timeout = '45min'
synchronous_commit = 'off'

EOS
