FROM openjdk:8-jdk-alpine
WORKDIR /app
COPY target/kafka-0.0.1-SNAPSHOT.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]
