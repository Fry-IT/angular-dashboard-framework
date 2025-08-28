FROM node:10

RUN npm install -g bower gulp

WORKDIR /app

COPY package.json bower.json .bowerrc gulpfile.js ./

RUN npm install
RUN npm rebuild node-sass

# Peer dependencies
RUN npm install angular@1.4 angular-ui-bootstrap@1.3.0 bootstrap@3.3.6 sortablejs@1.4.2

RUN bower install --allow-root --silent

COPY . .

EXPOSE 9001

CMD ["gulp", "serve"]
