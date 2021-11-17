FROM ubuntu:21.04

# set noninteractive installation
ENV DEBIAN_FRONTEND noninteractive
ENV TZ=America/New_York

RUN apt-get update \
 && apt-get -y install \
        apt-transport-https \
        wget \
 && rm -rf /var/lib/apt/lists/*

ENV DOTNET_CLI_TELEMETRY_OPTOUT=1

RUN wget https://packages.microsoft.com/config/ubuntu/21.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb \
 && dpkg -i packages-microsoft-prod.deb \
 && rm packages-microsoft-prod.deb \
 && apt-get update \
 && apt-get -y install \
        dotnet-sdk-6.0 \
 && rm -rf /var/lib/apt/lists/*
