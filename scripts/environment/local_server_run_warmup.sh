WORK_DIR=$(pwd)

source $WORK_DIR/scripts/config/env.sh

PYTHONPATH=$PYTHONPATH:$WORK_DIR python $WORK_DIR/scripts/environment/local_server_run_warmup.py