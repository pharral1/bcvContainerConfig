FROM node:latest

RUN apt-get update -y
RUN apt-get install -y apt-utils
RUN DEBIAN_FRONTEND=noninteractive
RUN apt-get install emacs -y

RUN mkdir /app
WORKDIR /app
COPY ./react /app/react
WORKDIR /app/react
RUN npm install --silent
RUN npm install react-scripts -g --silent
RUN npm run build

EXPOSE 3000