#!/bin/sh

cd /dcs/ && java -jar `ls dcs-payment-gateway-*.jar` --spring.config.location=/dcs/conf/
