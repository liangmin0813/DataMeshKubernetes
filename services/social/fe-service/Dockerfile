# Dockerfile for dcs-social-fe
# http://www.datamesh.com

FROM       registry.ap-southeast-1.aliyuncs.com/datamesh/alpine-nginx-rtmp:1.0 
MAINTAINER  Jianjun Xie <jianjunxie@datamesh.com>

# define volume
VOLUME /data/webpages
VOLUME /data/webpages/sc

# copy bianry
COPY  dist /data/webpages/
COPY  sc /data/webpages/sc

# cmd
EXPOSE 10480

