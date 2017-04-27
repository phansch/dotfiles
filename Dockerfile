FROM ubuntu:latest
MAINTAINER Philipp Hansch <dev@phansch.net>

ENV USER root
ENV TESTING true
RUN apt-get update -qq && apt-get install -y -qq \
    shellcheck \
    udev

COPY . /code
WORKDIR /code
