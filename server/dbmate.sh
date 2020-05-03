#!/bin/bash
#
# Wrapper for dbmate to avoid specifing migration directory, --no-dump-schema
# and --env options on each execution.
#
pgu="${PGUSER:-postgres}"
pgp="${PGPASSWORD:-postgres}"
pgh="${PGHOST:-localhost}"
pgt="${PGPORT:-5432}"
pgb="${PGDATABASE:-flutter_todomvc}"
pgs="${PGSSLMODE:-disable}"


DB_URL="postgres://${pgu}:${pgp}@${pgh}:${pgt}/${pgb}?sslmode=${pgs}" dbmate --no-dump-schema -d "./migrations" -e DB_URL "$@"
