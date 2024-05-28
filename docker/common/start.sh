#!/bin/sh

# this script used in docker-compose
dirpath="$(cd "$(dirname "$0")" && pwd)"
cd ${dirpath}

#java ${JAVA_OPTS} -Duser.timezone="${TZ}" -Djava.security.egd=file:/dev/./urandom -Dskywalking.agent.service_name=webase-xxx -javaagent:/webase/skywalking/agent/skywalking-agent.jar -jar app.jar
java ${JAVA_OPTS} -Duser.timezone="${TZ}" -Djava.security.egd=file:/dev/./urandom -jar app.jar

