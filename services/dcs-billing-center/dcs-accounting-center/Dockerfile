# Dockerfile for dcs-accounting-center-service
# http://www.datamesh.com

FROM        anapsix/alpine-java:8u121b13_server-jre_unlimited 
MAINTAINER  Jianjun Xie <jianjunxie@datamesh.com>

VOLUME /dcs

RUN mkdir /dcs/logs && mkdir /dcs/conf

COPY  /dcs-billing-center/src/dcs-accounting-center/target/dcs-accounting-center-*.jar /dcs/

# add entrypoint
COPY entrypoint.sh /usr/bin/
RUN  [ "chmod", "+x", "/usr/bin/entrypoint.sh" ]

# cmd
EXPOSE 9003

ENTRYPOINT ["entrypoint.sh"]
