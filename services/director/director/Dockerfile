# Dockerfile for dcs-director-director
# http://www.datamesh.com

FROM       registry.ap-southeast-1.aliyuncs.com/datamesh/alpine-glibc:1.0
MAINTAINER  Jianjun Xie <jianjunxie@datamesh.com>

# define volume
VOLUME /data/director

# copy bianry
COPY  director /data/director/
COPY  entrypoint.sh /usr/bin/
RUN   chmod +x /data/director/director && chmod +x /usr/bin/entrypoint.sh

# cmd
EXPOSE 10910

ENTRYPOINT ["entrypoint.sh"]
