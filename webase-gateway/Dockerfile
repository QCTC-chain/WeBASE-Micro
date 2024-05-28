FROM anapsix/alpine-java:8_server-jre_unlimited

MAINTAINER QCTC

RUN mkdir -p /webase/gateway/logs  \
    /webase/gateway/temp  \
    /webase/skywalking/agent

WORKDIR /webase/gateway

ENV SERVER_PORT=8080

EXPOSE ${SERVER_PORT}

ADD ./target/webase-gateway.jar ./app.jar

ENTRYPOINT ["java", \
            "-Djava.security.egd=file:/dev/./urandom", \
            "-Dserver.port=${SERVER_PORT}", \
#            "-Dskywalking.agent.service_name=webase-gateway", \
#            "-javaagent:/webase/skywalking/agent/skywalking-agent.jar", \
            "-jar", "app.jar"]
