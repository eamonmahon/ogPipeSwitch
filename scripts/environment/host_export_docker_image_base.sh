# Get current work dir
WORK_DIR=$(pwd)

if [ ! -d "$WORK_DIR/tmp" ]; then
    mkdir "$WORK_DIR/tmp"
else
    echo "Using previously made $WORK_DIR/tmp directory."
fi

# Import global variables
# execute the commands in the env.sh script within the current environment
source $WORK_DIR/scripts/config/env.sh

# Export the base docker image as a tar file
# -o specifies output file path and name
echo 'Exporting docker image:' $DOCKER_IMAGE_BASE_TAG
docker save -o $WORK_DIR/tmp/$DOCKER_IMAGE_BASE_FILENAME $DOCKER_IMAGE_BASE_TAG
echo 'Completed exporting of docker image:' $DOCKER_IMAGE_BASE_FILENAME
echo