FROM anapsix/alpine-java:8_server-jre_unlimited

MAINTAINER QCTC

RUN mkdir -p /webase/monitor/logs

WORKDIR /webase/monitor

EXPOSE 9100

ADD ./target/webase-monitor.jar ./app.jar

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "app.jar"]
