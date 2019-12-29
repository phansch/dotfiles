FROM ubuntu:latest
MAINTAINER Philipp Hansch <dev@phansch.net>

ENV USER root
USER root
ENV TESTING true

RUN uname -a

# Install extra test dependencies
RUN apt-get update -qq && apt-get install -y -qq --no-install-recommends \
    shellcheck \
    udev

COPY . /code
WORKDIR /code
