# Dockerfile for dcs-billing-service
# http://www.datamesh.com

FROM        anapsix/alpine-java:8u121b13_server-jre_unlimited 
MAINTAINER  Jianjun Xie <jianjunxie@datamesh.com>

VOLUME /dcs

RUN mkdir /dcs/logs && mkdir /dcs/config

COPY  /dcs-billing/target/dcs-billing-*.jar /dcs/

# add entrypoint
COPY entrypoint.sh /usr/bin/
RUN  [ "chmod", "+x", "/usr/bin/entrypoint.sh" ]

# cmd
EXPOSE 6777

ENTRYPOINT ["entrypoint.sh"]