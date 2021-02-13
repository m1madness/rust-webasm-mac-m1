FROM node:15-alpine
RUN apt-get -y update
RUN apt-get install -y python
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci
COPY . .
EXPOSE 3000
CMD [ "npm", "start" ]
