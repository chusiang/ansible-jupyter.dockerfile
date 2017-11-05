FROM opensuse:42.3

MAINTAINER Chu-Siang Lai <chusiang@drx.tw>

# Add third-party repository.
RUN zypper addrepo -Gf http://download.opensuse.org/repositories/systemsmanagement/openSUSE_Leap_42.3/ systemsmanagement

# Upgrade.
RUN zypper update -y

# Install the requires package and python.
RUN zypper -n install \
      kernel-devel gcc python python-pip python-devel \
      libffi-devel-gcc5 libopenssl-devel libzmq5 \
      && \
      zypper clean -a

# Install the Ansible 2.0+
RUN zypper -n install ansible && \
      zypper clean -a

# for disable localhost warning message.
RUN /bin/echo -e "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts

# Upgrade the pip to lastest.
RUN pip install -U pip

# Setup with Ansible.
ADD https://raw.githubusercontent.com/chusiang/ansible-jupyter.dockerfile/master/setup_jupyter.yml /home
RUN ansible-playbook -vvvv /home/setup_jupyter.yml

# Copy a ipython notebook example to image.
ADD https://raw.githubusercontent.com/chusiang/ansible-jupyter.dockerfile/master/ipynb/ansible_on_jupyter.ipynb /home/
ADD https://raw.githubusercontent.com/chusiang/ansible-jupyter.dockerfile/master/ipynb/ansible_on_jupyter_opensuse.ipynb /home/

# Run service of Jupyter.
COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT [ "docker-entrypoint.sh" ]
EXPOSE 8888

CMD [ "jupyter", "--version" ]
