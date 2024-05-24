#!/bin/bash

set -e

# Build artifact to docker image.
# In this case, it is necessary to start the build. 
# This step takes place during the artifact build step and then attaches to deployment.
mvn package -DskipTests

# These variables must be forwarded to the script for successful initialization. 
# I don't make any checks, because in this case the variables are set hard. 
TARGET_DIR=./target # Set path to artifact dirictory
RELEASE_NAME=test-task-k8s # Used to start the HELM. In common cases it is equal to $GIT_REPONAME
DOCKER_IMAGE=lostroma/$RELEASE_NAME:latest # Or $DOCKER_REPOSITORY/$GIT_REPONAME:$GIT_SHA
HELM_DIR=./helm
HELM_VALUES_FILE=$HELM_VALUES_DIR/values.yaml
DOCKERFILE=./docker/Dockerfile

# Find the newest JAR file in the $TARGET_DIR
JAR_FILE=$(find $TARGET_DIR -type f -name "*.jar" -printf "%T@ %p\n" | sort -n | cut -d' ' -f 2- | tail -n 1)

# Set variables or get them from the system environments
DOCKER_USERNAME=username
DOCKER_PASSWORD=password

# Build a Docker image using $DOCKERFILE and $JAR_FILE
docker buildx build \
  -t $DOCKER_IMAGE \
  --file $DOCKERFILE \
  --build-arg JAR_FILE=$JAR_FILE \
  --push .

# If the Helm release does not exist, perform installation, else perform an upgrade
# Before executing this command, kubeconfig must also be configured.
# There is a more innovative approach. Helm chart is stored in a separate repository in which variables and in this case image are set.
# This repository is connected to ArgoCD, which itself is responsible for the deployment process
helm upgrade --install $RELEASE_NAME $HELM_DIR -f $HELM_VALUES_FILE --set image=$DOCKER_IMAGE
