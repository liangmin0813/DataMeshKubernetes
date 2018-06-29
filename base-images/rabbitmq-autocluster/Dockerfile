FROM rabbitmq:3.6.14-alpine

MAINTAINER frognew

RUN apk update && apk add ca-certificates && \
    apk add tzdata && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone
    

ADD plugins/*.ez /opt/rabbitmq/plugins/
RUN rabbitmq-plugins --offline enable \ 
    rabbitmq_management \
    rabbitmq_consistent_hash_exchange \
    rabbitmq_federation \
    rabbitmq_federation_management \
    rabbitmq_mqtt \
    rabbitmq_shovel \
    rabbitmq_shovel_management \
    rabbitmq_stomp \
    rabbitmq_web_stomp \
    autocluster
