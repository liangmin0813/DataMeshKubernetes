# Dockerfile for dcs-director-director-server
# http://www.datamesh.com

FROM       registry.ap-southeast-1.aliyuncs.com/datamesh/alpine-glibc:1.0
MAINTAINER  Jianjun Xie <jianjunxie@datamesh.com>

# define volume
VOLUME /data/director-server

# copy bianry
COPY  director-server /data/director-server/
COPY  entrypoint.sh /usr/bin/
RUN   chmod +x /data/director-server/director-server && chmod +x /usr/bin/entrypoint.sh

# cmd
EXPOSE 12121

ENTRYPOINT ["entrypoint.sh"]
