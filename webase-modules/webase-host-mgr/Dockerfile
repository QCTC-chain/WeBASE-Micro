FROM anapsix/alpine-java:8_server-jre_unlimited

MAINTAINER QCTC

RUN mkdir -p /webase/host-mgr/logs \
    /webase/host-mgr/temp \
    /webase/skywalking/agent

WORKDIR /webase/system

ENV SERVER_PORT=9205

EXPOSE ${SERVER_PORT}

ADD ./target/webase-host-mgr.jar ./app.jar

ENTRYPOINT ["java", \
            "-Djava.security.egd=file:/dev/./urandom", \
            "-Dserver.port=${SERVER_PORT}", \
#            "-Dskywalking.agent.service_name=webase-host", \
#            "-javaagent:/webase/skywalking/agent/skywalking-agent.jar", \
            "-jar", "app.jar"]
