FROM alpine:3.8

MAINTAINER Chu-Siang Lai <chusiang@drx.tw>

# Update the index of available packages.
RUN apk update

# Install the requires apk package and python.
RUN apk add --no-cache linux-headers gcc build-base python py-pip python-dev \
        libffi-dev openssl-dev ca-certificates

# Upgrade the pip to lastest.
RUN pip install -U pip

# Setup the ansible.
RUN pip install 'ansible>=2.6.0,<2.7.0'

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
