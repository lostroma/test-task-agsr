## Building Docker Image for `test-task-k8s`

To build the Docker image for the `test-task-k8s` application, you can use the following command:

### From the git `test-task-k8s` root directory:

```bash
docker build -t test-task-k8s \
  -f ./docker/Dockerfile \
  --build-arg JAR_FILE="./backend/target/*.jar" .
```

### From the git `test-task-k8s` ./docker directory:
```bash
docker build -t test-task-k8s \
  -f ./Dockerfile ..
```
This command will initiate the Docker build process and create a Docker image named `test-task-k8s` for the `test-task-k8s` application. Make sure to execute the command that corresponds to your current directory.