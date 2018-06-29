# Dockerfile for dcs-drive-service
# http://www.datamesh.com

FROM       registry.ap-southeast-1.aliyuncs.com/datamesh/alpine-glibc-ffmpeg:1.0
MAINTAINER  Jianjun Xie <jianjunxie@datamesh.com>

# define volume
VOLUME /data/drive-service

# copy bianry
COPY  drive-service /data/drive-service/
COPY  entrypoint.sh /usr/bin/
RUN   chmod +x /data/drive-service/drive-service && chmod +x /usr/bin/entrypoint.sh

# cmd
EXPOSE 10710

ENTRYPOINT ["entrypoint.sh"]