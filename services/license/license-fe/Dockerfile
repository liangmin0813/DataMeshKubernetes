# Dockerfile for dcs-license-fe
# http://www.datamesh.com

FROM       registry.ap-southeast-1.aliyuncs.com/datamesh/alpine-nginx-rtmp:1.0 
MAINTAINER  Jianjun Xie <jianjunxie@datamesh.com>

# define volume
VOLUME /data/webpages/dcs

# copy static webpages
COPY  dcs /data/webpages/dcs

# cmd
EXPOSE 8880