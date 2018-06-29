# Dockerfile for dcs-remote-expert-fe
# http://www.datamesh.com

FROM       registry.ap-southeast-1.aliyuncs.com/datamesh/alpine-nginx-rtmp:1.0 
MAINTAINER  Jianjun Xie <jianjunxie@datamesh.com>

# define volume
VOLUME /data/webpages

# copy bianry
COPY  dist /data/webpages/

# cmd
EXPOSE 10480

