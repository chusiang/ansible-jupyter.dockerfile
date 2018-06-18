FROM ubuntu:18.04

MAINTAINER Chu-Siang Lai <chusiang@drx.tw>

# Update the index of available packages.
RUN apt-get update

# Install the requires apt package and python.
RUN apt-get install -y --no-install-recommends \
      linux-headers-generic gcc build-essential python python-pip python-dev \
      libffi-dev \
      && \
      apt-get clean

# Setup the ansible.
RUN apt-get install -y --no-install-recommends software-properties-common

RUN add-apt-repository ppa:ansible/ansible -y && apt-get update

RUN apt-get install -y --no-install-recommends \
      ansible \
      && \
      apt-get clean

# for disable localhost warning message.
RUN /bin/echo -e "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts

# Upgrade the pip to lastest.
RUN pip install -U pip

# Setup with Ansible.
ADD https://raw.githubusercontent.com/chusiang/ansible-jupyter.dockerfile/master/setup_jupyter.yml /home
RUN ansible-playbook -v /home/setup_jupyter.yml

# Copy a ipython notebook example to image.
ADD https://raw.githubusercontent.com/chusiang/ansible-jupyter.dockerfile/master/ipynb/ansible_on_jupyter.ipynb /home/
ADD https://raw.githubusercontent.com/chusiang/ansible-jupyter.dockerfile/master/ipynb/ansible_on_jupyter_ubuntu.ipynb /home/

# Run service of Jupyter.
COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT [ "docker-entrypoint.sh" ]
EXPOSE 8888

CMD [ "jupyter", "--version" ]
