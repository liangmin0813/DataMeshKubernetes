#!/bin/sh

cd /dcs/ && java -jar `ls dcs-account-*.jar` --spring.config.location=/dcs/conf/
