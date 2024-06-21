# Get current work dir
# WORK_DIR=$(pwd)/PipeSwitch
WORK_DIR=$(pwd)
echo 'Current working directory (sould be eamons-PS)' $WORK_DIR

# Import global variables
source $WORK_DIR/scripts/config/env.sh

# Build the image bash, which compiles PyTorch from source
echo 'Create docker image:' $DOCKER_IMAGE_READY_MODEL_TAG
# docker build -t $DOCKER_IMAGE_READY_MODEL_TAG -f $WORK_DIR/Dockerfile/Dockerfile-ready_model $WORK_DIR/Dockerfile
docker build --no-cache -t $DOCKER_IMAGE_READY_MODEL_TAG -f $WORK_DIR/Dockerfile/Dockerfile-ready_model .
echo 'Complete creating docker image:' $DOCKER_IMAGE_READY_MODEL_TAG
echo