#base image
FROM ubuntu:latest

#install all apt requirements
RUN apt-get update -y
RUN apt-get install -y apt-utils
RUN DEBIAN_FRONTEND=noninteractive

RUN apt-get install python3.6 python3-pip -y

#make app directory
RUN mkdir /opt/app
WORKDIR /opt/app

#store requirements file, must exist in the Dockerfile directory
COPY ./requirements.txt /opt/app
RUN mkdir ./crimeRestAPI2.0
COPY ./crimeRestAPI2.0 /opt/app/crimeRestAPI2.0


#install all python packages from requirements
RUN apt-get install libmysqlclient-dev -y
RUN apt-get install mysql-client -y
RUN python3 -m pip install -r requirements.txt

#Migrate the server
EXPOSE 8000
WORKDIR /opt/app/crimeRestAPI2.0
