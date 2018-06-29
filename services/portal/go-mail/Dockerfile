# Dockerfile for dcs-portal-mail
# http://www.datamesh.com

FROM       registry.ap-southeast-1.aliyuncs.com/datamesh/alpine-glibc:1.0 
MAINTAINER  Jianjun Xie <jianjunxie@datamesh.com>

# define volume
VOLUME /data/go-mail

# copy bianry
COPY  go-mail /data/go-mail/
COPY  entrypoint.sh /usr/bin/
RUN   chmod +x /data/go-mail/go-mail && chmod +x /usr/bin/entrypoint.sh

# cmd
EXPOSE 8094

ENTRYPOINT ["entrypoint.sh"]