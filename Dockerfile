FROM ubuntu:latest
MAINTAINER Philipp Hansch <dev@phansch.net>

ENV USER root
USER root
ENV TESTING true

RUN uname -a

# Make sure we don't get any readline prompts on CI
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Install extra test dependencies
RUN apt-get update -qq && apt-get install -y -qq --no-install-recommends \
    shellcheck \
    udev

COPY . /code
WORKDIR /code
