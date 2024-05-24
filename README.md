# test-task-k8s


## [A diagram of the minimum infrastructure for monitoring and application logging](https://drive.google.com/file/d/1auOCo5eVR2r3DSy9a1oa0j8MTAE9-8FA/view?usp=sharing)


## HowTo (usage example)

### How to build Java artifact
```bash
mvn package -DskipTests
```

### How to build docker image
Find information in the [`test-task-k8s/docker/Dockerfile`](https://github.com/lostroma/test-task-k8s/docker/README.md)

### How to run Helm chart
```bash
APP_NAME=app-agsr
helm upgrade --install $APP_NAME ./helm -f ./helm/values.yaml
```
