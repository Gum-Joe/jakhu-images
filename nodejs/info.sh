# Gives info on image
echo Infomation about this docker image:
echo Docker image name: $JAKHU_DOCKER_IMAGE
echo OS: $JAKHU_OS_IMAGE
echo OS docker tag: $JAKHU_OS_IMAGE_TAG
echo Docker image version at HEAD: `cd /jakhuImages && git rev-parse --short HEAD`
echo Full name: $JAKHU_WORKER_NAME
