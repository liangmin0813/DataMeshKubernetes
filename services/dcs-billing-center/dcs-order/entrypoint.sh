#!/bin/sh

cd /dcs/ && java -jar `ls dcs-order-*.jar` --spring.config.location=/dcs/conf/
