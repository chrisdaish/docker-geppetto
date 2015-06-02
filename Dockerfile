FROM ubuntu:14.04

MAINTAINER Chris Daish <chrisdaish@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV GEPPETTOPACKAGE geppetto-linux.gtk.x86_64-4.3.1-R201501182354.zip
ENV uid 1000
ENV gid 1000

RUN useradd -m geppetto; \
    apt-get update; \
    apt-get install -y  unzip \
			wget; \
    rm -rf /var/lib/apt/lists/*

RUN wget -q https://downloads.puppetlabs.com/geppetto/4.x/$GEPETTOPACKAGE -O /tmp/$GEPPETTOPACKAGE; \
    mkdir /home/geppetto/geppetto; \
    unzip /tmp/$GEPPETTOPACKAGE -d /home/geppetto/geppetto

COPY start-geppetto.sh /home/geppetto/

ENTRYPOINT ["/home/geppetto/start-geppetto.sh"]
