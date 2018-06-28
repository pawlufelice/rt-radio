FROM node:10-slim
WORKDIR /code
COPY package.json /code
# This token is for the (anonymous i.e. read only) user npmroot:
ENV NPM_TOKEN=eb1cbff8-98f3-3ee2-9ed8-bd93c253c4f4
RUN yarn add --registry=http://nexus.raketech.local/repository/npm-public/ -g gulpjs/gulp-cli
RUN yarn install --registry=http://nexus.raketech.local/repository/npm-public/
COPY . /code
EXPOSE 3000
CMD [ "gulp", "prod" ]
