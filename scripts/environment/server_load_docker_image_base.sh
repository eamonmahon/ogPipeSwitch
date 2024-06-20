# Get current work dir
WORK_DIR=$(pwd)/eamons-PS

# Import global variables
source $WORK_DIR/scripts/config/env.sh

# Import docker image
# This loads the docker image from the tar file that has been imported into the local Docker engine
# which makes it available to start a container.
# -i specifies the input tar file
echo 'Import docker image:' $DOCKER_IMAGE_BASE_TAG
docker load -i ~/$DOCKER_IMAGE_BASE_FILENAME
echo 'Complete importing docker image:' $DOCKER_IMAGE_BASE_FILENAME
echo