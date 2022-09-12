############################################################
# Dockerfile to build reconWTF
# Based on Debian
############################################################

FROM ubuntu

MAINTAINER solo10010

# update repository

RUN apt update

##################-WORKDIR-################################

RUN mkdir -p /var/www

COPY . /var/www

WORKDIR /var/www

EXPOSE 8000

RUN apt install python3.9
RUN python3.9 -m pip install --upgrade pip
RUN source venv/bin/activate 
RUN python converter/manage.py test