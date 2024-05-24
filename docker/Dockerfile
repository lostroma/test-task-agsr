# Use openjdk:21-oracle image.
# It is better to create your own basic images that utilize the necessary software and logic.
FROM openjdk:21-oracle

# Setup work directory
WORKDIR /app

# Set an environment variable with the path to the home directory and artifact path and set it to its default value
ARG JAR_FILE=../target/*.jar

# Copy jar file into docker image
COPY ${JAR_FILE} /app/app.jar

EXPOSE 80

# Run JAR file into container
CMD ["java", "-jar", "app.jar"]
