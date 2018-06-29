# Dockerfile for dcs-sso-service
# http://www.datamesh.com

FROM        registry.ap-southeast-1.aliyuncs.com/datamesh/alpine-glibc:1.0
MAINTAINER  Jianjun Xie <jianjunxie@datamesh.com>

# define volume
VOLUME /data/sso-service

# copy bianry
COPY  sso-service /data/sso-service/
COPY  template  /data/sso-service/template/
COPY  entrypoint.sh /usr/bin/
RUN   chmod +x /data/sso-service/sso-service && chmod +x /usr/bin/entrypoint.sh

# cmd
EXPOSE 8811

ENTRYPOINT ["entrypoint.sh"]