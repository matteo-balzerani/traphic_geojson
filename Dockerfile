FROM node:alpine3.11

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json ./
COPY package-lock.json ./

RUN npm install

# Bundle app source
COPY . .

RUN npm install --global typescript@latest
RUN tsc --build ./tsconfig.json

EXPOSE 3000
CMD [ "node", "dist/app.js" ]