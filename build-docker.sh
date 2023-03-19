#!/bin/bash
./build.sh

docker  build --no-cache -f src/main/docker/Dockerfile.jvm  -t  expressionless/scryfallq:latest .

#clean up
image_ids=$(docker images | grep dateq | grep none)
if [ "${image_ids:-0}" == 0 ]; then
  echo 'Skip clean up'
else
  docker images | grep scryfallq | grep none | awk '{print $3}' | xargs docker rmi
fi
