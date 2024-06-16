# Get current work dir
WORK_DIR=$(pwd)
echo 'Current working directory:' $WORK_DIR

# Import global variables
# execute the commands in the env.sh script within the current environment
echo 'Import global variables from env.sh'
source $WORK_DIR/scripts/config/env.sh

# Build the image bash, which compiles PyTorch from source
echo 'Create docker image:' $DOCKER_IMAGE_BASE_TAG
docker build -t $DOCKER_IMAGE_BASE_TAG -f $WORK_DIR/Dockerfile/Dockerfile-base $WORK_DIR/Dockerfile
echo 'Complete creating docker image:' $DOCKER_IMAGE_BASE_TAG
echo