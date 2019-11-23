cd rest/crimeRestAPI2.0
git pull origin containerConfig
cd ../../db/LoadScript
git pull origin containerBranch
cd ../../app/react
git pull origin master
cd ../..
docker-compose build
