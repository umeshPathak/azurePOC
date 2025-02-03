# Use an official OpenJDK base image

# Use a smaller base image to run the app (smaller footprint)
FROM openjdk:17-jdk-slim as build
FROM maven:3.9.6-eclipse-temurin-17 AS builder

# Set the working directory in the container
WORKDIR /app

# Copy the Maven project files
COPY pom.xml .
COPY src ./src

# Run Maven to build the project and create the JAR file
RUN mvn clean package -DskipTests
RUN ls -l target/

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file from the build image
COPY --from=build /app/target/hello-world-spring-boot-*.jar /app/hello-world-spring-boot.jar

# Expose the port your Spring Boot app runs on
EXPOSE 8080

# Run the Spring Boot app
ENTRYPOINT ["java", "-jar", "/app/hello-world-spring-boot.jar"]
