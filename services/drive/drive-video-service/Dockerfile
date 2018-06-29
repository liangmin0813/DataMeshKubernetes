# Dockerfile for dcs-drive-video-service
# http://www.datamesh.com

FROM       registry.ap-southeast-1.aliyuncs.com/datamesh/alpine-glibc-ffmpeg:1.0
MAINTAINER  Jianjun Xie <jianjunxie@datamesh.com>

# define volume
VOLUME /data/drive-video-service

# copy bianry
COPY  drive-video-service /data/drive-video-service/
COPY  entrypoint.sh /usr/bin/
RUN   chmod +x /data/drive-video-service/drive-video-service && chmod +x /usr/bin/entrypoint.sh

# cmd
EXPOSE 10707 10717

ENTRYPOINT ["entrypoint.sh"]
