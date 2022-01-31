FROM alpine

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN apk add --no-cache ansible py3-pip bash

RUN pip3 install --upgrade pip

WORKDIR /usr/src/app
