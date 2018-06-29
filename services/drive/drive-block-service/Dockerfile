# Dockerfile for dcs-drive-block-service
# http://www.datamesh.com

FROM       registry.ap-southeast-1.aliyuncs.com/datamesh/alpine-glibc:1.0
MAINTAINER  Jianjun Xie <jianjunxie@datamesh.com>

# define volume
VOLUME /data/drive-block-service

# copy bianry
COPY  drive-block-service /data/drive-block-service/
COPY  entrypoint.sh /usr/bin/
RUN   chmod +x /data/drive-block-service/drive-block-service && chmod +x /usr/bin/entrypoint.sh

# cmd
EXPOSE 10705 10715

ENTRYPOINT ["entrypoint.sh"]