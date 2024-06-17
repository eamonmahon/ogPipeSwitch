# Get current work dir
# WORK_DIR=$(pwd)/PipeSwitch
WORK_DIR=$(pwd)/eamons-PS


# Import global variables
source $WORK_DIR/scripts/config/env.sh

# Build the image bash, which compiles PyTorch from source
echo "------------------------- [EAMON][TEST] IF THIS APPEARS"
echo 'Create docker image:' $DOCKER_IMAGE_READY_MODEL_TAG
docker build --no-cache -t $DOCKER_IMAGE_READY_MODEL_TAG -f $WORK_DIR/Dockerfile/Dockerfile-ready_model $WORK_DIR/Dockerfile
echo 'Complete creating docker image:' $DOCKER_IMAGE_READY_MODEL_TAG
echo