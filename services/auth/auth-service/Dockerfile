# Dockerfile for dcs-auth-service
# http://www.datamesh.com

FROM        registry.ap-southeast-1.aliyuncs.com/datamesh/alpine-glibc:1.0
MAINTAINER  Jianjun Xie <jianjunxie@datamesh.com>

# define volume
VOLUME /data/auth-service

# copy bianry
COPY  auth-service /data/auth-service/
COPY  entrypoint.sh /usr/bin/
RUN   chmod +x /data/auth-service/auth-service && chmod +x /usr/bin/entrypoint.sh

# cmd
EXPOSE 10400 10401

ENTRYPOINT ["entrypoint.sh"]