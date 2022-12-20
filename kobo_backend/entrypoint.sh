#!/bin/bash

# Wait until Postgres is ready.
while ! pg_isready -q -h $PGHOST -p $PGPORT -U $PGUSER
do
  echo "$(date) - waiting for database to start"
  sleep 2
done

# Check if DB exists. Create + Migrate + Populate if not.
if [[ -z `psql -Atqc "\\list $PGDATABASE"` ]]; then
  mix ecto.create
  mix ecto.migrate
  mix run priv/repo/seeds.exs
fi

exec mix phx.server