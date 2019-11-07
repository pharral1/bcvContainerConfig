#!/bin/bash

sudo service mysql stop
set -e

echo "Spinning up database and REST API docker containers"
docker-compose up -d
echo "Container info:"
docker-compose ps

echo "Testing http connection to localhost REST API"
python3 ./rest/test_conn.py

echo "Loading data into database container"
cd db/LoadScript
./build.sh
