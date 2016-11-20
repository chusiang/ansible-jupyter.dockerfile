FROM alpine:3.4

MAINTAINER Chu-Siang Lai <chusiang@drx.tw>

# Install the requires apk package and python.
RUN apk update
RUN apk add --no-cache linux-headers gcc build-base python py-pip python-dev \
        libffi-dev openssl-dev

# Upgrade the pip to lastest.
RUN pip install -U pip

# Setup the ansible.
RUN pip install ansible

# for disable localhost warning message.
RUN mkdir /etc/ansible && \
      /bin/echo -e "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts

# Setup with Ansible.
COPY setup_jupyter.yml /home
RUN ansible-playbook -vvvv /home/setup_jupyter.yml

# Copy a ipython notebook example to image.
COPY files/ansible_on_jupyter.ipynb /home/

# Run service of Jupyter.
COPY files/docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT [ "docker-entrypoint.sh" ]
EXPOSE 8888

CMD [ "jupyter", "--version" ]
