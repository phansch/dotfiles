FROM ubuntu:24.04
MAINTAINER Philipp Hansch <dev@phansch.net>

ENV USER=root
USER root
ENV TESTING=true
ENV CI=true

RUN uname -a

# Make sure we don't get any readline prompts on CI
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Install some base dependencies for a faster setup run
# These mirror some of the packages in `./setup` and `_setup-scripts/debian.sh`
RUN apt-get update -qq && apt-get install -y -qq --no-install-recommends \
    shellcheck \
    build-essential \
    cmake \
    git-delete-merged-branches \
    libglib2.0-dev \
    libssl-dev \
    curl \
    fontconfig \
    git \
    wget \
    software-properties-common \
    libssl-dev \
    libsqlite3-dev \
    libreadline-dev \
    libffi-dev \
    snapd
COPY . /code
WORKDIR /code
