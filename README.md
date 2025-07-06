# 📨 Kafka Spring Boot Microservice with Docker & UI

This project demonstrates how to integrate **Apache Kafka** with a **Spring Boot 2.7.13** application using **Docker Compose**. It includes a REST API to send messages to Kafka and uses **Kafka UI** for managing topics and inspecting messages.

---

## 📦 Tech Stack

- Java 8
- Spring Boot 2.7.13
- Apache Kafka 7.2.1
- Zookeeper
- Docker + Docker Compose
- Kafka UI (by Provectus)

---

## 📁 Project Structure

````
kafka-springboot-app/
├── docker-compose.yml
├── Dockerfile
├── wait-for-it.sh
├── src/
│   └── main/java/com/example/kafka/
│       ├── KafkaApplication.java
│       ├── config/KafkaProducerConfig.java
│       ├── controller/MessageController.java
│       └── producer/MessageProducer.java
└── pom.xml

````

---

## 🚀 How to Run the Project

### ✅ Prerequisites

- [Docker](https://www.docker.com/)
- [Maven](https://maven.apache.org/)
- Java 8 installed

---

### ⚙️ 1. Build the Application JAR

```bash
mvn clean package -DskipTests
````

This creates `target/kafka-springboot-app-0.0.1-SNAPSHOT.jar`.

---

### 🐳 2. Start All Services with Docker

```bash
docker-compose up --build
```

This starts:

* Kafka
* Zookeeper
* Spring Boot App (on port `9090`)
* Kafka UI (on port `8085`)

---

## 📬 Usage

### ✅ Send a Kafka Message

Send a POST request:

```bash
curl -X POST http://localhost:9090/api/send \
     -H "Content-Type: application/json" \
     -d '"Hello Kafka!"'
```

This sends the message to the Kafka topic: `demo-topic`

---

## 🔎 Kafka UI Dashboard

Kafka UI is available at:

👉 [http://localhost:8085](http://localhost:8085)

Use it to:

* Browse topics
* View messages
* Check consumer groups
* Inspect brokers and partitions

---

## 🛠️ Configuration Overview

### ✅ Kafka Configuration (`KafkaProducerConfig.java`)

```java
config.put(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, "kafka:9092");
```

Uses Kafka service from Docker internal network.

---

### ✅ Kafka UI in Docker Compose

```yaml
kafka-ui:
  image: provectuslabs/kafka-ui:latest
  ports:
    - "8085:8080"
  environment:
    - KAFKA_CLUSTERS_0_NAME=local
    - KAFKA_CLUSTERS_0_BOOTSTRAPSERVERS=kafka:9092
    - KAFKA_CLUSTERS_0_ZOOKEEPER=zookeeper:2181
```

---

## 🧰 Tools

* `docker-compose`: orchestration for app, Kafka, Zookeeper, and Kafka UI.

---

## 🔁 Clean Restart

```bash
docker-compose down -v   # stop & remove all containers and volumes
mvn clean package -DskipTests
docker-compose up --build
```

---