# Dockerfile for dcs-portal-fe
# http://www.datamesh.com

FROM       registry.ap-southeast-1.aliyuncs.com/datamesh/alpine-nginx-rtmp:1.0 
MAINTAINER  Jianjun Xie <jianjunxie@datamesh.com>

# define volume
VOLUME /data/webpages/dcs
VOLUME /data/webpages/portal

# copy static webpages
COPY  dcs /data/webpages/dcs
COPY  portal /data/webpages/portal

# cmd
EXPOSE 8880