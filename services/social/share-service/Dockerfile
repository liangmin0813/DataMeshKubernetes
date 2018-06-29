# Dockerfile for dcs-social-share-service
# http://www.datamesh.com

FROM       registry.ap-southeast-1.aliyuncs.com/datamesh/alpine-glibc-ffmpeg:1.0 
MAINTAINER  Jianjun Xie <jianjunxie@datamesh.com>

# define volume
VOLUME /data/share-service

# copy bianry
COPY  share-service /data/share-service/
COPY  entrypoint.sh /usr/bin/
RUN   chmod +x /data/share-service/share-service && chmod +x /usr/bin/entrypoint.sh

# cmd
EXPOSE 10402

ENTRYPOINT ["entrypoint.sh"]
