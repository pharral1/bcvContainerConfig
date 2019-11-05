cd rest/crimeRestAPI2.0
git pull origin containerConfig
cd ../../db/LoadScript
git pull origin containerBranch
cd ../..
docker-compose build
