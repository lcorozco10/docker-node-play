FROM node:current-alpine3.16

LABEL org.opencontainer.image.title="Hello Docker devs" \
    org.opencontainer.image.desription="Web server node" \
    org.opencontainer.image.author="lcorozco@gmail.com"

RUN mkdir -p /usr/src/app

COPY . /usr/src/app

WORKDIR /usr/src/app

RUN npm install

ENTRYPOINT [ "npm", "start" ]