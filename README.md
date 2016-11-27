# Docker image: Ansible on Jupyter Notebook

A Docker image for run [Ansible][ansible_offical] 2.2 on [Jupyter Notebook][jupyter_official] 4.2 (ipython notebook) with Browsers.

[ansible_offical]:  https://www.ansible.com/
[jupyter_official]: http://jupyter.org/

## Supported tags and respective `Dockerfile` links

- `alpine-3.4`, `latest` [*(alpine/Dockerfile)*][dockerfile_alpine]
- `archlinux` [*(archlinux/Dockerfile)*][dockerfile_archlinux]
- `centos-7` [*(centos-7/Dockerfile)*][dockerfile_centos-7]
- `debian-7` [*(debian-7/Dockerfile)*][dockerfile_debian-7]
- `debian-8` [*(debian-8/Dockerfile)*][dockerfile_debian-8]
- `gentoo` [*(gentoo/Dockerfile)*][dockerfile_gentoo]
- `opensuse-42.1` [*(opensuse-42.1/Dockerfile)*][dockerfile_opensuse-42.1]
- `ubuntu-14.04` [*(ubuntu-14.04/Dockerfile)*][dockerfile_ubuntu-14.04]
- `ubuntu-16.04` [*(ubuntu-16.04/Dockerfile)*][dockerfile_ubuntu-16.04]

[dockerfile_alpine]:        https://github.com/chusiang/ansible-jupyter.dockerfile/blob/master/alpine/Dockerfile
[dockerfile_archlinux]:        https://github.com/chusiang/ansible-jupyter.dockerfile/blob/master/archlinux/Dockerfile
[dockerfile_centos-7]:      https://github.com/chusiang/ansible-jupyter.dockerfile/blob/master/centos-7/Dockerfile
[dockerfile_debian-7]:      https://github.com/chusiang/ansible-jupyter.dockerfile/blob/master/debian-7/Dockerfile
[dockerfile_debian-8]:      https://github.com/chusiang/ansible-jupyter.dockerfile/blob/master/debian-8/Dockerfile
[dockerfile_gentoo]:        https://github.com/chusiang/ansible-jupyter.dockerfile/blob/master/gentoo/Dockerfile
[dockerfile_opensuse-42.1]:  https://github.com/chusiang/ansible-jupyter.dockerfile/blob/master/opensuse-42.1/Dockerfile
[dockerfile_ubuntu-14.04]:  https://github.com/chusiang/ansible-jupyter.dockerfile/blob/master/ubuntu-14.04/Dockerfile
[dockerfile_ubuntu-16.04]:  https://github.com/chusiang/ansible-jupyter.dockerfile/blob/master/ubuntu-16.04/Dockerfile

## Build image

1. Get this project.

    ```
    $ git clone https://github.com/chusiang/ansible-jupyter.dockerfile.git
    ```

1. Go to workspace.

    ```
    $ cd ansible-jupyter.dockerfile/
    ```

1. Bunild the image.

    ```
    $ docker build -t chusiang/ansible-jupyter .
    ```

## Run container

1. Get image.
    
    ```
    $ docker pull chusiang/ansible-jupyter
    ```

1. Run the container with daemon mode.
    
    ```
    $ docker run --name ansible-jupyter -P -d chusiang/ansible-jupyter
    be8a15b9d4da5d24610c1fc738cb13086f01101e90f94640360d8d84892de772
    ```

1. Check container process.

    ```
    $ docker ps
    CONTAINER ID        IMAGE                      COMMAND                  CREATED             STATUS              PORTS                     NAMES
    be8a15b9d4da        chusiang/ansible-jupyter   "docker-entrypoint.sh"   12 seconds ago      Up 11 seconds       0.0.0.0:32808->8888/tcp   ansible-jupyter
    ```

1. Enter container with command line.

    ```
    $ docker exec -it ansible-jupyter sh
    / #
    ```
    
## Play Ansible on Jupyter

Now, you can play the Ansible on Jupyter.

1. Go jupyter web.

    ```
    # GNU/Linux
    $ firefox http://localhost:32786
    
    # macOS
    $ open http://localhost:32786
    ```
    
    ![2016-11-20-ansible-jupyter1]

[2016-11-20-ansible-jupyter1]: https://cloud.githubusercontent.com/assets/219066/20463322/218f0c4a-af6b-11e6-9a95-2411ec7acb5f.png

1. Attach my example ==> [`ansible_on_jupyter.ipynb`][ansible_on_jupyter.ipynb].

    ![2016-11-20-ansible-jupyter2]

[ansible_on_jupyter.ipynb]: https://github.com/chusiang/ansible-jupyter.dockerfile/blob/master/ipynb/ansible_on_jupyter.ipynb
[2016-11-20-ansible-jupyter2]: https://cloud.githubusercontent.com/assets/219066/20463319/fa8c047c-af6a-11e6-96d6-f985096c9c8c.png

1. Remember use the `!` prefix to trigger system command.

Enjoy it !
