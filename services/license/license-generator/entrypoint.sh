#!/bin/sh

cd /license/ && java -jar `ls license-generator-*.jar` --spring.config.location=/license/conf/
