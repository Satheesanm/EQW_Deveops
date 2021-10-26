#!/bin/bash
set -e

PGPASSWORD="w2UIO@#bg532!" pg_dump -Fc \
  -h work-samples-db.cx4wctygygyq.us-east-1.rds.amazonaws.com \
  -p 5432 \
  -U readonly \
  -d work_samples \
  -f /var/lib/postgresql/data/dump.pgsql

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE ROLE eq_dev WITH SUPERUSER;
    CREATE ROLE readonly WITH SUPERUSER;
EOSQL

PGPASSWORD="test" pg_restore -Fc \
  -p 5432 \
  -U postgres \
  --dbname=work_samples /var/lib/postgresql/data/dump.pgsql
