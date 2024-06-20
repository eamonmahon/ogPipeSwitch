# Get current work dir of where script is running and store in variable
WORK_DIR=$(pwd)
echo 'Current working directory:' $WORK_DIR

# Import variables from env.sh
# execute the commands in the env.sh script within the current environment
echo 'Import global variables from env.sh'
source $WORK_DIR/scripts/config/env.sh

# Build the image bash, which compiles PyTorch from source
# -t is the tag -f specifies the path to the Dockerfile
# the final argument is the build context which includes any files and folders for the docker daemon to use
# the docker daemon is the background service that manages docker containers and images on the system
echo 'Creating docker image:' $DOCKER_IMAGE_BASE_TAG
docker build -t $DOCKER_IMAGE_BASE_TAG -f $WORK_DIR/Dockerfile/Dockerfile-base $WORK_DIR/Dockerfile
echo 'Completed build of docker image:' $DOCKER_IMAGE_BASE_TAG
echo