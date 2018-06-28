FROM node:10
WORKDIR /code
COPY package.json /code
# This token is for the (anonymous i.e. read only) user npmroot:
ENV NPM_TOKEN=eb1cbff8-98f3-3ee2-9ed8-bd93c253c4f4
RUN  npm i -g gulpjs/gulp-cli
RUN npm install 
COPY . /code
EXPOSE 3000
# RUN gulp prod
# CMD [ "node", "/code/build/server.js" ]
CMD [ "gulp", "dev" ]
