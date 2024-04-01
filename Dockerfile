FROM openjdk:11-jdk
VOLUME /tmp
LABEL maintainer="sigit galih f"
WORKDIR /opt/app
COPY target/tes-0.0.1-SNAPSHOT.jar dockertes.jar
EXPOSE 8081
ENTRYPOINT exec java -jar dockertes.jar