# Get current work dir
WORK_DIR=$(pwd)

# Import global variables
source $WORK_DIR/scripts/config/env.sh

# Copy the base docker to the server
# The PYTHONPATH environment variable is temporarily extended to include $WORK_DIR before running a Python script. 
# This ensures that when the Python interpreter runs, it includes the specified directory ($WORK_DIR) in 
# its search path for modules. This is necessary if the script depends on Python modules located in or relative to $WORK_DIR.
# These modules include import_server_list and RunRemoteRepo
echo 'Copy base docker image to servers'
PYTHONPATH=$PYTHONPATH:$WORK_DIR python scripts/environment/host_push_docker_image_base.py $WORK_DIR/scripts/config/servers.txt $WORK_DIR/tmp/$DOCKER_IMAGE_BASE_FILENAME
echo 'Complete loading docker image for base to servers'
echo