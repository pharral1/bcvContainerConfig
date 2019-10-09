FROM ubuntu:latest

#install all apt requirements
RUN apt-get update -y
RUN apt-get install -y apt-utils
RUN DEBIAN_FRONTEND=noninteractiv

RUN apt-get install mysql-server -y
RUN apt-get install mysql-client -y
RUN apt-get install libmysqlclient20 -y
RUN apt-get install default-libmysqlclient-dev -y

#make app directory
RUN mkdir /opt/app
WORKDIR /opt/app

RUN mkdir ./BCV_Database
COPY ./BCV_Database /opt/app/BCV_Database

#Populate the database and create the APIUser
WORKDIR /opt/app/BCV_Database
RUN service mysql start ; mysql < BCV_createAll.sql; mysql < BCV_loadAll.sql; mysql < BCV_createAPIUser.sql

EXPOSE 3306
