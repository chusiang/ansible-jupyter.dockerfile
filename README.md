# Docker image: Ansible on Jupyter

A Docker image for run Ansible on Jupyter (ipython notebook).

- Current version on Alpine 3.4:
 - Ansible: **2.2.0.0**
 - Jupyter: **4.2.0**
 - Python: **2.7.12**
 - pip: **9.0.1**

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
    $ docker build -t ansible-jupyter .
    ```

## Run container

1. Run the container with daemon mode.
    
    ```
    $ docker run --name ansible-jupyter -P -d ansible-jupyter
    be8a15b9d4da5d24610c1fc738cb13086f01101e90f94640360d8d84892de772
    ```

1. Check container process.

    ```
    $ docker ps
    CONTAINER ID        IMAGE                      COMMAND                  CREATED             STATUS              PORTS                     NAMES
    be8a15b9d4da        ansible-jupyter   "docker-entrypoint.sh"   12 seconds ago      Up 11 seconds       0.0.0.0:32808->8888/tcp   ansible-jupyter
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
    
    ![2016-11-20-ansible-jupyter1](https://cloud.githubusercontent.com/assets/219066/20463322/218f0c4a-af6b-11e6-9a95-2411ec7acb5f.png)


1. Attach my example ==> [`ansible_on_jupyter.ipynb`
](https://github.com/chusiang/ansible-jupyter.dockerfile/blob/master/ipynb/ansible_on_jupyter.ipynb).

    ![2016-11-20-ansible-jupyter](https://cloud.githubusercontent.com/assets/219066/20463319/fa8c047c-af6a-11e6-96d6-f985096c9c8c.png)

1. Remember use the `!` prefix to trigger command.

Enjoy it ! 