# Dockerfile for dcs-library-service
# http://www.datamesh.com

FROM       registry.ap-southeast-1.aliyuncs.com/datamesh/alpine-glibc-ffmpeg:1.0 
MAINTAINER  Jianjun Xie <jianjunxie@datamesh.com>

# define volume
VOLUME /data/library-service

# copy bianry
COPY  library-service /data/library-service/
COPY  entrypoint.sh /usr/bin/
RUN   chmod +x /data/library-service/library-service && chmod +x /usr/bin/entrypoint.sh

# cmd
EXPOSE 10402

ENTRYPOINT ["entrypoint.sh"]
