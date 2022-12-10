FROM php:8-apache

# Install a basic simple text editor so users can edit the cluster.ini
RUN ["apt-get", "update"]
RUN ["apt-get", "install", "-y", "nano"]

LABEL org.opencontainers.image.version: "1.0"
LABEL org.opencontainers.image.authors="Edgar Hernandez <imacleopard2010@gmail.com>"
LABEL org.opencontainers.image.description="This a simple Apache 8/PHP application for use with amunets conan server transfer mod. https://steamcommunity.com/workshop/filedetails/discussion/2305969565/2968398851791582758/"

WORKDIR /var/www/html
COPY src .