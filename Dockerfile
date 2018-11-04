FROM ubuntu:latest
MAINTAINER Philipp Hansch <dev@phansch.net>

ENV USER root
USER root
ENV TESTING true

RUN uname -a

# Install test dependencies
RUN apt-get update -qq && apt-get install -y -qq --no-install-recommends \
    shellcheck \
    udev \
    python3-pip \
    python3-setuptools
RUN pip3 install vim-vint

COPY . /code
WORKDIR /code
