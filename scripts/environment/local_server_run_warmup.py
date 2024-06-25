import os
import sys

from scripts.common.util import RunLocalDocker

def main():
        with RunLocalDocker('pipeswitch:ready_model') as rd:
            # Run a warmup script inside the Docker container
            rd.run('python scripts/environment/container_run_warmup.py')
    
    # Get and return the data point

if __name__ == '__main__':
    main()