# Dockerfile for dcs-digital-assistant-service
# http://www.datamesh.com

FROM       registry.ap-southeast-1.aliyuncs.com/datamesh/alpine-glibc:1.0
MAINTAINER  Jianjun Xie <jianjunxie@datamesh.com>

# define volume
VOLUME /data/digital-assistant

# copy bianry
COPY  digital-assistant /data/digital-assistant/
COPY  entrypoint.sh /usr/bin/
RUN   chmod +x /data/digital-assistant/digital-assistant && chmod +x /usr/bin/entrypoint.sh

# cmd
EXPOSE 11010

ENTRYPOINT ["entrypoint.sh"]
