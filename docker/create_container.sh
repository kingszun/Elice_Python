SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)

cd $SCRIPT_DIR

IMAGE_NAME=kingszun/elice_python_3.9.17
CONTAINER_NAME=ElicePython

docker build -t $IMAGE_NAME .
docker image tag $IMAGE_NAME $IMAGE_NAME:1.0.0

docker rm -f ${CONTAINER_NAME}

docker run \
-it \
--privileged \
--shm-size=8gb \
--net=host \
--entrypoint="/bin/bash" \
--name=${CONTAINER_NAME} \
$IMAGE_NAME 