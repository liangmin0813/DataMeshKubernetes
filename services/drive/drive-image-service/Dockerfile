# Dockerfile for dcs-drive-image-service
# http://www.datamesh.com

FROM       registry.ap-southeast-1.aliyuncs.com/datamesh/alpine-glibc-ffmpeg:1.0
MAINTAINER  Jianjun Xie <jianjunxie@datamesh.com>

# define volume
VOLUME /data/drive-image-service

# copy bianry
COPY  drive-image-service /data/drive-image-service/
COPY  entrypoint.sh /usr/bin/
RUN   chmod +x /data/drive-image-service/drive-image-service && chmod +x /usr/bin/entrypoint.sh

# cmd
EXPOSE 10706 10716

ENTRYPOINT ["entrypoint.sh"]