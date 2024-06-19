# Get current work dir
WORK_DIR=$(pwd)

# Import global variables
source $WORK_DIR/scripts/config/env.sh

PYTHONPATH=$PYTHONPATH:$WORK_DIR python scripts/environment/host_build_docker_image_ready_model.py $WORK_DIR/scripts/config/servers.txt
echo 'Complete building docker image for pipeswitch to servers'
echo