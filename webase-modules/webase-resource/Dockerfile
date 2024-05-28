FROM anapsix/alpine-java:8_server-jre_unlimited

MAINTAINER QCTC

RUN mkdir -p /webase/resource/logs \
    /webase/resource/temp \
    /webase/skywalking/agent

WORKDIR /webase/resource

ENV SERVER_PORT=9204

EXPOSE ${SERVER_PORT}

ADD ./target/webase-resource.jar ./app.jar

ENTRYPOINT ["java", \
            "-Djava.security.egd=file:/dev/./urandom", \
            "-Dserver.port=${SERVER_PORT}", \
#            "-Dskywalking.agent.service_name=webase-resource", \
#            "-javaagent:/webase/skywalking/agent/skywalking-agent.jar", \
            "-jar", "app.jar"]
