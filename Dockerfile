FROM ubuntu:18.04
MAINTAINER Philipp Hansch <dev@phansch.net>

ENV USER root
USER root
ENV TESTING true
ENV CI true

RUN uname -a

# Install extra test dependencies
RUN apt-get update -qq && apt-get install -y -qq --no-install-recommends \
    shellcheck \
    udev

COPY . /code
WORKDIR /code
