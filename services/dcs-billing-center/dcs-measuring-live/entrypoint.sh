#!/bin/sh

cd /dcs/ && java -jar `ls dcs-measuring-live-*.jar` --spring.config.location=/dcs/conf/
