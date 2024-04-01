FROM openjdk:11-jdk
VOLUME /tes
LABEL maintainer="sigit galih f"
WORKDIR /tes
COPY target/tes-0.0.1-SNAPSHOT.jar tesraildanamon.jar
EXPOSE 8081
ENTRYPOINT exec java -jar tesraildanamon.jar