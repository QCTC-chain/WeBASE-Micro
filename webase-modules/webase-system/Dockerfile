FROM anapsix/alpine-java:8_server-jre_unlimited

MAINTAINER QCTC

RUN mkdir -p /webase/system/logs \
    /webase/system/temp \
    /webase/skywalking/agent

WORKDIR /webase/system

ENV SERVER_PORT=9201

EXPOSE ${SERVER_PORT}

ADD ./target/webase-system.jar ./app.jar

ENTRYPOINT ["java", \
            "-Djava.security.egd=file:/dev/./urandom", \
            "-Dserver.port=${SERVER_PORT}", \
#            "-Dskywalking.agent.service_name=webase-system", \
#            "-javaagent:/webase/skywalking/agent/skywalking-agent.jar", \
            "-jar", "app.jar"]
