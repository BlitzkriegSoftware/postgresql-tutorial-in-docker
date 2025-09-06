#!/bin/bash
export username=postgres
export PGPASSWORD="password123-"
export master=postgres
export sales=salesdb
/usr/lib/postgresql/17/bin/psql  -h 127.0.0.1 -U $username -d $master -a -f ./00_new_database.sql
/usr/lib/postgresql/17/bin/psql  -h 127.0.0.1 -U $username -d $sales  -a -f ./01_create_objects.sql
/usr/lib/postgresql/17/bin/psql  -h 127.0.0.1 -U $username -d $sales  -a -f ./02_insert_data.sql