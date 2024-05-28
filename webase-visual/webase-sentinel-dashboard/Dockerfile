FROM anapsix/alpine-java:8_server-jre_unlimited

MAINTAINER QCTC

RUN mkdir -p /webase/sentinel-dashboard/logs \
    /webase/skywalking/agent

WORKDIR /webase/sentinel-dashboard

EXPOSE 8718

ADD ./target/webase-sentinel-dashboard.jar ./app.jar

ENTRYPOINT ["java", \
            "-Djava.security.egd=file:/dev/./urandom", \
#            "-Dskywalking.agent.service_name=webase-sentinel-dashboard", \
#            "-javaagent:/webase/skywalking/agent/skywalking-agent.jar", \
            "-jar", "app.jar"]
