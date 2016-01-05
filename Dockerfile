# DOCKER-VERSION 1.0.1
# VERSION        0.5

FROM debian:jessie
MAINTAINER Swaraj Yadav <yadav.swaraj@gmail.com>

RUN apt-get update && apt-get install -y openjdk-7-jre-headless wget vim
RUN wget -q -O - http://apache.mirrors.pair.com/zookeeper/zookeeper-3.4.7/zookeeper-3.4.7.tar.gz | tar -xzf - -C /opt \
    && mv /opt/zookeeper-3.4.7 /opt/zookeeper \
    && mkdir -p /opt/zookeeper/data

RUN cp /opt/zookeeper/conf/zoo_sample.cfg /opt/zookeeper/conf/zoo.cfg

RUN echo "server.1=localhost:2888:3887" >> /opt/zookeeper/conf/zoo.cfg
RUN echo "server.2=localhost:2888:3888" >> /opt/zookeeper/conf/zoo.cfg
RUN echo "server.3=localhost:2888:3889" >> /opt/zookeeper/conf/zoo.cfg

RUN touch /opt/zookeeper/data/myid

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

EXPOSE 2181 2182 2183 2888 3887 3888 3889

WORKDIR /opt/zookeeper
