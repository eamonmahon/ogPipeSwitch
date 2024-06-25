import os

class RunRemoteRepo:
    def __init__(self, server, branch):
        self.server = server
        self.branch = branch

    def __enter__(self):
        os.system("ssh %s 'git clone --quiet --branch %s https://github.com/eamonmahon/PipeSwitch.git'" % (self.server['id'], self.branch))
        return self

    def __exit__(self, *args, **kwargs):
        os.system("ssh %s 'rm -rf ~/PipeSwitch'" % self.server['id'])

    def run(self, cmd):
        os.system("ssh %s '%s'" % (self.server['id'], cmd))

class RunDocker:
    def __init__(self, image, branch):
        self.image = image
        self.name = 'pipeswitch-%s' % branch
        self.branch = branch

    def __enter__(self):
        os.system('docker run --name %s --rm -it -d --gpus all -w /workspace %s bash' % (self.name, self.image))
        self.run('git clone --quiet --branch %s https://github.com/eamonmahon/PipeSwitch.git' % self.branch)
        return self

    def __exit__(self, *args, **kwargs):
        os.system('docker stop %s' % self.name)

    def run(self, cmd):
        os.system('docker exec -w /workspace %s %s' % (self.name, cmd))

class RunLocalDocker:
    def __init__(self, image):
        self.image = image
        self.name = 'pipeswitch'

    def __enter__(self):
        # Start a Docker container in detached mode with GPU support
        os.system(f'docker run --name {self.name} --rm -it -d --gpus all -w /workspace {self.image} bash')
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        # Stop the Docker container when exiting the context
        os.system(f'docker stop {self.name}')

    def run(self, cmd):
        # Execute a command in the Docker container
        os.system(f'docker exec -w /workspace {self.name} {cmd}')


def import_server_list(path):
    server_list = []
    with open(path) as f:
        for line in f.readlines():
            parts = line.split(',')
            ser_ip_str = parts[0].strip()
            ser_name = parts[1].strip()
            server_list.append({'ip': ser_ip_str, 'id': ser_name})
    return server_list