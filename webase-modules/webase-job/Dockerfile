FROM anapsix/alpine-java:8_server-jre_unlimited

MAINTAINER QCTC

RUN mkdir -p /webase/job/logs \
    /webase/job/temp \
    /webase/skywalking/agent

WORKDIR /webase/job

ENV SERVER_PORT=9203

EXPOSE ${SERVER_PORT}

ADD ./target/webase-job.jar ./app.jar

ENTRYPOINT ["java", \
            "-Djava.security.egd=file:/dev/./urandom", \
            "-Dserver.port=${SERVER_PORT}", \
#            "-Dskywalking.agent.service_name=webase-job", \
#            "-javaagent:/webase/skywalking/agent/skywalking-agent.jar", \
            "-jar", "app.jar"]
