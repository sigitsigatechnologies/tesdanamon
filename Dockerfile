FROM openjdk:11-jdk-slim
VOLUME /tmp
LABEL maintainer="sigit galih f"
WORKDIR /opt/app
COPY target/tes-0.0.1-SNAPSHOT.jar dockertes.jar
EXPOSE 8081
ENTRYPOINT ["java","-jar","dockertes.jar"]