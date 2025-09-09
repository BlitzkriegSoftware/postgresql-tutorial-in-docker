#!/usr/bin/env bash
export role="postgres"
su - "${role}"
cd /var/lib/postgresql/data/salesdb
export username="postgres"
export PGPASSWORD="password123-"
export master="postgres"
export sales="salesdb"
/usr/lib/postgresql/17/bin/psql  -h "localhost" -U "${username}" -d "${master}" -a -f ./00_new_database.sql
/usr/lib/postgresql/17/bin/psql  -h "localhost" -U "${username}" -d "${sales}"  -a -f ./01_create_objects.sql
/usr/lib/postgresql/17/bin/psql  -h "localhost" -U "${username}" -d "${sales}"  -a -f ./02_insert_data.sql