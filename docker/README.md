## Building Docker Image for `test-task-agsr`

To build the Docker image for the `test-task-agsr` application, you can use the following command:

### From the git `test-task-agsr` root directory:

```bash
docker build -t test-task-agsr \
  -f ./docker/Dockerfile \
  --build-arg JAR_FILE="./backend/target/*.jar" .
```

### From the git `test-task-agsr` ./docker directory:
```bash
docker build -t test-task-agsr \
  -f ./Dockerfile ..
```
This command will initiate the Docker build process and create a Docker image named `test-task-agsr` for the `test-task-agsr` application. Make sure to execute the command that corresponds to your current directory.