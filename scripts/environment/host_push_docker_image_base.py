import os
import sys

from scripts.common.util import RunRemoteRepo, import_server_list

def main():
    server_list_path = sys.argv[1]
    image_path = sys.argv[2] # tar image path

    print("Pushing image " + image_path + " to servers specified from: " + server_list_path)

    server_list = import_server_list(server_list_path)

    for server in server_list:
        src = image_path
        dst = server['id'] + ':~/'
        
        # copy the tar file (image) from the host to the servers
        print ('%s> Copy base docker image' % server['id'])
        os.system('scp %s %s' % (src, dst))
        print ('%s> Completed copying base docker image to server.' % server['id'])

        print ('%s> Load base docker image on server.' % server['id'])
        with RunRemoteRepo(server, 'main') as rrr:
            rrr.run("bash ~/PipeSwitch/scripts/environment/server_load_docker_image_base.sh")
            
        print ('%s> Complete loading base docker image' % server['id'])

        

if __name__ == '__main__':
    main()