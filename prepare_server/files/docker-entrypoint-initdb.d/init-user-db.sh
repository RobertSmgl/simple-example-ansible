#!/bin/bash
set -e

psql <<-EOSQL
	CREATE USER example_user WITH PASSWORD 'example_pass';
	CREATE DATABASE example_db;
	GRANT ALL PRIVILEGES ON DATABASE example_db TO example_user;
	GRANT pg_read_all_data TO example_user;
	GRANT pg_write_all_data TO example_user;
EOSQL

psql example_db < /etc/db_dumb/back.sql
