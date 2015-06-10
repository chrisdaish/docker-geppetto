FROM ubuntu:14.04

MAINTAINER Chris Daish <chrisdaish@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV GEPPETTOPACKAGE geppetto-linux.gtk.x86_64-4.3.1-R201501182354.zip
ENV uid 1000
ENV gid 1000

RUN useradd -m geppetto; \
    apt-get update; \
    apt-get install --no-install-recommends -y unzip \
                                               wget \
                                               openjdk-7-jre; \
    rm -rf /var/lib/apt/lists/*

RUN wget --quiet --no-check-certificate https://downloads.puppetlabs.com/geppetto/4.x/$GEPPETTOPACKAGE -O /tmp/$GEPPETTOPACKAGE; \
    mkdir /home/geppetto/geppetto; \
    unzip /tmp/$GEPPETTOPACKAGE -d /home/geppetto; \
    rm -rf /tmp/$GEPPETTOPACKAGE

COPY start-geppetto.sh /home/geppetto/

ENTRYPOINT ["/home/geppetto/start-geppetto.sh"]
