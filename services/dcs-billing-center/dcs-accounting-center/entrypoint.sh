#!/bin/sh

cd /dcs/ && java -jar `ls dcs-accounting-center-*.jar` --spring.config.location=/dcs/conf/
