FROM bash

RUN apk update && apk add curl && apk add jq

RUN mkdir -p /usr/app/cli

WORKDIR /usr/app/cli

COPY . . 

RUN chmod +x gitcr
