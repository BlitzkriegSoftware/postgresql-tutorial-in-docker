#!/bin/bash
export DBNAME="dvdrental"
export VOL="/var/lib/postgresql/data"
export POSTDB="postgres"
export USERNAME="postgres"
export PGPASSWORD='password123-'
psql -c "CREATE DATABASE ${DBNAME}" "user=${USERNAME} dbname=${POSTDB} password=${PGPASSWORD}"
pg_restore -w -c -U postgres -d "${DBNAME}" "${VOL}/dvdrental.tar"
