FROM openjdk:11-jdk-slim
VOLUME /tmp
LABEL maintainer="sigit galih f"
WORKDIR /opt/app
COPY ./ /opt/app
RUN mvn clean install -DskipTests
COPY target/tes-0.0.1-SNAPSHOT.jar dockertes.jar
ENV PORT 8081
EXPOSE $PORT
ENTRYPOINT ["java","-jar","-Dserver.port=${PORT}","dockertes.jar"]