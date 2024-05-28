FROM anapsix/alpine-java:8_server-jre_unlimited

MAINTAINER QCTC

RUN mkdir -p /webase/auth/logs  \
    /webase/auth/temp  \
    /webase/skywalking/agent

WORKDIR /webase/auth

ENV SERVER_PORT=9210

EXPOSE ${SERVER_PORT}

ADD ./target/webase-auth.jar ./app.jar

ENTRYPOINT ["java", \
            "-Djava.security.egd=file:/dev/./urandom", \
            "-Dserver.port=${SERVER_PORT}", \
#            "-Dskywalking.agent.service_name=webase-auth", \
#            "-javaagent:/webase/skywalking/agent/skywalking-agent.jar", \
            "-jar", "app.jar"]
