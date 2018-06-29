# Dockerfile for dcs-portal-service
# http://www.datamesh.com

FROM       registry.ap-southeast-1.aliyuncs.com/datamesh/alpine-glibc:1.0
MAINTAINER  Jianjun Xie <jianjunxie@datamesh.com>

# define volume
VOLUME /data/portal-service

# copy bianry
COPY  portal-service /data/portal-service/
COPY  entrypoint.sh /usr/bin/
RUN   chmod +x /data/portal-service/portal-service && chmod +x /usr/bin/entrypoint.sh

# cmd
EXPOSE 8822

ENTRYPOINT ["entrypoint.sh"]