#!/bin/bash
#
# Load JWT secret from .jwtsecret and start PostgREST with configuration: api.conf
#
if [ ! -f ".jwtsecret" ]; then
  echo "Missing generated secret file in .jwtsecret"
  exit 1
fi

jwt_secret="`cat .jwtsecret`"

# APP_JWT_SECRET="$jwtsecret" ./postgrest api.conf
# This would not be necessary if PostgREST's app.settings.jwt_secret="$(APP_JWT_SECRET) worked"
pgu="${PGUSER:-postgres}"
psql -U $pgu -d flutter_todomvc -c "ALTER DATABASE flutter_todomvc SET app.jwt_secret TO '$jwt_secret'"

./postgrest api.conf
