FROM debian:7

MAINTAINER Chu-Siang Lai <chusiang@drx.tw>

# Update the index of available packages.
RUN apt-get update

# Install the requires apt package and python.
RUN apt-get install -y --no-install-recommends \
      linux-headers-amd64 gcc build-essential python python-pip python-dev \
      libffi-dev libssl-dev \
      && \
      apt-get clean

# Upgrade the pip to lastest.
RUN pip install -i https://pypi.python.org/simple/ -U pip && \
      ln -fs /usr/local/bin/pip /usr/bin/pip

# Setup the ansible.
RUN pip install ansible

# for disable localhost warning message.
RUN mkdir /etc/ansible && \
      /bin/echo -e "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts

# Setup with Ansible.
ADD https://raw.githubusercontent.com/chusiang/ansible-jupyter.dockerfile/master/setup_jupyter.yml /home
RUN ansible-playbook -vvvv /home/setup_jupyter.yml

# Copy a ipython notebook example to image.
ADD https://raw.githubusercontent.com/chusiang/ansible-jupyter.dockerfile/master/ipynb/ansible_on_jupyter.ipynb /home/

# Run service of Jupyter.
COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT [ "docker-entrypoint.sh" ]
EXPOSE 8888

CMD [ "jupyter", "--version" ]
