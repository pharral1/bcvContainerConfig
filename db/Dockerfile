FROM mysql:latest

#Store all config files in mysql entrypoiny
COPY ./LoadScript/dataDump.sql /docker-entrypoint-initdb.d

EXPOSE 3306
