# Dockerfile for dcs-license-generator-service
# http://www.datamesh.com

FROM        anapsix/alpine-java:8u121b13_server-jre_unlimited 
MAINTAINER  Jianjun Xie <jianjunxie@datamesh.com>

VOLUME /license

RUN mkdir /license/logs && mkdir /license/conf

COPY  /license-generator/src/target/license-generator-*.jar /license/

# add entrypoint
COPY entrypoint.sh /usr/bin/
RUN  [ "chmod", "+x", "/usr/bin/entrypoint.sh" ]

# cmd
EXPOSE 6500

ENTRYPOINT ["entrypoint.sh"]
