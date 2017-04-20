FROM ubuntu:latest
MAINTAINER Philipp Hansch <dev@phansch.net>

RUN apt-get update -qq && apt-get install -y -qq \
    shellcheck

COPY . /code
WORKDIR /code
