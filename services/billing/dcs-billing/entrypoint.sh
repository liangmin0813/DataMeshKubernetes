#!/bin/sh

cd /dcs/ && java -Dspring.config.location=/dcs/config/ -jar `ls dcs-billing-*.jar`
