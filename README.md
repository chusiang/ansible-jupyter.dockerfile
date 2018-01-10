# Docker image: Ansible on Jupyter Notebook

[![Docker Hub](https://img.shields.io/badge/docker-ansible--jupyter-blue.svg)](https://hub.docker.com/r/chusiang/ansible-jupyter/) [![microbadger](https://images.microbadger.com/badges/image/chusiang/ansible-jupyter.svg)](https://microbadger.com/images/chusiang/ansible-jupyter "Get your own image badge on microbadger.com")

A Docker image for run [Ansible][ansible_official] 2.4.1 on [Jupyter Notebook][jupyter_official] 4.4.0 (ipython notebook) with Browsers.

[ansible_official]:  https://www.ansible.com/
[jupyter_official]: http://jupyter.org/

## Supported tags and respective `Dockerfile` links

- `alpine-3.4` [*(alpine-3.4/Dockerfile)*][dockerfile_alpine-3.4]
- ~~`alpine-3.4_ansible-2.1`~~ [*(alpine-3.4_ansible-2.1/Dockerfile)*][dockerfile_alpine-3.4_ansible-2.1]
- `alpine-3.6`, `latest` [*(alpine-3.6/Dockerfile)*][dockerfile_alpine-3.6]
- `alpine-3.6_ansible-2.3` [*(alpine-3.6_ansible-2.3/Dockerfile)*][dockerfile_alpine-3.6_ansible-2.3]
- `archlinux` [*(archlinux/Dockerfile)*][dockerfile_archlinux]
- `centos-7` [*(centos-7/Dockerfile)*][dockerfile_centos-7]
- ~~`debian-7`~~ [*(debian-7/Dockerfile)*][dockerfile_debian-7]
- `debian-8` [*(debian-8/Dockerfile)*][dockerfile_debian-8]
- `debian-9` [*(debian-9/Dockerfile)*][dockerfile_debian-9]
- ~~`gentoo`~~ [*(gentoo/Dockerfile)*][dockerfile_gentoo]
- ~~`opensuse-42.1`~~ [*(opensuse-42.1/Dockerfile)*][dockerfile_opensuse-42.1]
- `opensuse-42.2` [*(opensuse-42.2/Dockerfile)*][dockerfile_opensuse-42.2]
- `opensuse-42.3` [*(opensuse-42.3/Dockerfile)*][dockerfile_opensuse-42.3]
- `ubuntu-14.04` [*(ubuntu-14.04/Dockerfile)*][dockerfile_ubuntu-14.04]
- `ubuntu-16.04` [*(ubuntu-16.04/Dockerfile)*][dockerfile_ubuntu-16.04]

[dockerfile_alpine-3.4]:    https://github.com/chusiang/ansible-jupyter.dockerfile/blob/master/alpine-3.4/Dockerfile
[dockerfile_alpine-3.4_ansible-2.1]: https://github.com/chusiang/ansible-jupyter.dockerfile/blob/master/alpine-3.4_ansible-2.1/Dockerfile
[dockerfile_alpine-3.6]:    https://github.com/chusiang/ansible-jupyter.dockerfile/blob/master/alpine-3.6/Dockerfile
[dockerfile_alpine-3.6_ansible-2.3]: https://github.com/chusiang/ansible-jupyter.dockerfile/blob/master/alpine-3.6_ansible-2.3/Dockerfile
[dockerfile_archlinux]:     https://github.com/chusiang/ansible-jupyter.dockerfile/blob/master/archlinux/Dockerfile
[dockerfile_centos-7]:      https://github.com/chusiang/ansible-jupyter.dockerfile/blob/master/centos-7/Dockerfile
[dockerfile_debian-7]:      https://github.com/chusiang/ansible-jupyter.dockerfile/blob/master/debian-7/Dockerfile
[dockerfile_debian-8]:      https://github.com/chusiang/ansible-jupyter.dockerfile/blob/master/debian-8/Dockerfile
[dockerfile_debian-9]:      https://github.com/chusiang/ansible-jupyter.dockerfile/blob/master/debian-9/Dockerfile
[dockerfile_gentoo]:        https://github.com/chusiang/ansible-jupyter.dockerfile/blob/master/gentoo/Dockerfile
[dockerfile_opensuse-42.1]: https://github.com/chusiang/ansible-jupyter.dockerfile/blob/master/opensuse-42.1/Dockerfile
[dockerfile_opensuse-42.2]: https://github.com/chusiang/ansible-jupyter.dockerfile/blob/master/opensuse-42.2/Dockerfile
[dockerfile_opensuse-42.3]: https://github.com/chusiang/ansible-jupyter.dockerfile/blob/master/opensuse-42.3/Dockerfile
[dockerfile_ubuntu-14.04]:  https://github.com/chusiang/ansible-jupyter.dockerfile/blob/master/ubuntu-14.04/Dockerfile
[dockerfile_ubuntu-16.04]:  https://github.com/chusiang/ansible-jupyter.dockerfile/blob/master/ubuntu-16.04/Dockerfile

## Build image

1. Get this project.

    ```
    $ git clone https://github.com/chusiang/ansible-jupyter.dockerfile.git
    ```

1. Go to workspace.

    ```
    $ cd ansible-jupyter.dockerfile/<IMAGE_TAG>/
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

You can see more detail at [怎麼用 Jupyter 操控 Ansible？(localhost) | 現代 IT 人一定要知道的 Ansible 自動化組態技巧](https://chusiang.gitbooks.io/automate-with-ansible/07.how-to-practive-the-ansible-with-jupyter1.html) .

Enjoy it !

## License

Copyright (c) chusiang from 2016-2018 under the MIT license.
