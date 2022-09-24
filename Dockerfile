FROM node:current-alpine3.16

LABEL org.opencontainer.image.title="Hello Docker devs" \
    org.opencontainer.image.desription="Web server node" \
    org.opencontainer.image.author="lcorozco@gmail.com"

ENV NODE_ENV=developement
ENV PORT=3000

RUN mkdir -p /usr/src/app

COPY . /usr/src/app

WORKDIR /usr/src/app

RUN npm install
RUN echo "We use this port = ${PORT}"
EXPOSE ${PORT}

ENTRYPOINT [ "npm", "start" ]