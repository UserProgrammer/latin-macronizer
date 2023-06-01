#!/bin/bash

check_postgres_readiness() {
  pg_isready -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME"
  return $?
}

# Loop until PostgreSQL is ready
until check_postgres_readiness; do
  echo "PostgreSQL is not yet ready. Retrying in 3 seconds..."
  sleep 3
done

sleep 10000
