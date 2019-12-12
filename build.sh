echo $1
if [ $1 -eq 1 ]
then
cd rest/crimeRestAPI2.0
git pull origin master
cd ../../db/LoadScript
git pull origin containerBranch
cd ../../app/react
git pull origin master
cd ../..
fi
docker-compose build
