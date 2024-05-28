FROM anapsix/alpine-java:8_server-jre_unlimited

MAINTAINER QCTC

RUN mkdir -p /webase/seata-server/logs \
    /webase/skywalking/agent

WORKDIR /webase/seata-server

ENV TZ=PRC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

EXPOSE 7091
EXPOSE 8091

ADD ./target/webase-seata-server.jar ./app.jar

ENTRYPOINT ["java", \
            "-Djava.security.egd=file:/dev/./urandom", \
#            "-Dskywalking.agent.service_name=webase-seata-server", \
#            "-Dskywalking.plugin.seata.server=true", \
#            "-javaagent:/webase/skywalking/agent/skywalking-agent.jar", \
            "-jar", "app.jar"]
