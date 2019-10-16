cd rest/crimeRestAPI2.0
git pull origin containerConfig
cd ../../db/BCV_Database
git pull origin Docker-Branch
cd ../..
docker-compose build
