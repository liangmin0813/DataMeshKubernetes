FROM        registry.ap-southeast-1.aliyuncs.com/datamesh/alpine-glibc:1.0
MAINTAINER  Jianjun Xie <jianjunxie@datamesh.com>

ADD     https://meshexpert-us.s3.amazonaws.com/ffmpeg   /usr/local/bin/
RUN		chmod +x /usr/local/bin/ffmpeg

CMD           ["--help"]
ENTRYPOINT    ["ffmpeg"]
