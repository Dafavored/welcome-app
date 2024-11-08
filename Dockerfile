# Use a base image with Java and Maven
FROM maven:3.8.5-openjdk-11 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven project files to the container
COPY pom.xml /app
COPY src /app/src

# Build the Maven project
RUN mvn clean package

# Use a lightweight JDK image to run the application
FROM openjdk:11-jre-slim

# Set the working directory for the runtime container
WORKDIR /app

# Copy the jar file from the build container
COPY --from=build /app/target/*.jar app.jar

# Expose the port your application uses
EXPOSE 8080

# Define the command to run your application
CMD ["java", "-jar", "app.jar"]

