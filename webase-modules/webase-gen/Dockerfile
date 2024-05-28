FROM anapsix/alpine-java:8_server-jre_unlimited

MAINTAINER QCTC

RUN mkdir -p /webase/gen/logs

WORKDIR /webase/gen

ENV SERVER_PORT=9202

EXPOSE ${SERVER_PORT}

ADD ./target/webase-gen.jar ./app.jar

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-Dserver.port=${SERVER_PORT}", "-jar", "app.jar"]
