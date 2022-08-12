FROM maven:3.8.6-jdk-11-slim AS build
WORKDIR /app
COPY ./pom.xml ./pom.xml
COPY ./src/ ./src/
RUN mvn clean package

FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=build ./app/target/hellodocker-0.0.1-SNAPSHOT.jar ./app/hellodocker.jar
EXPOSE 8080
ENTRYPOINT [ "java", "-jar", "./app/hellodocker.jar" ]