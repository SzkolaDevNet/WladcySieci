FROM jenkins/jenkins:alpine

USER root

RUN apk update

RUN apk add shadow gcc libffi-dev python-dev linux-headers musl-dev \
    openssl-dev make automake openrc 

RUN apk add docker py-pip

RUN pip install --upgrade pip

RUN pip install docker-compose

RUN usermod -aG docker jenkins
    
RUN pip install ansible \
    && pip install Jinja2 \
    && pip install robotframework 

RUN groupdel ping

RUN groupmod -g 999 docker
