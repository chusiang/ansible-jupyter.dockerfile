FROM finalduty/archlinux:daily

MAINTAINER Chu-Siang Lai <chusiang@drx.tw>

# Upgrade the currently installed packages.
RUN pacman -Syu

# Install the requires package and python.
RUN pacman -S --noconfirm linux-headers gcc python python-pip base-devel \
      libffi openssl \
      && \
      pacman -Scc --noconfirm

# Upgrade the pip to lastest.
RUN pip install -U pip

# Setup the ansible.
RUN pacman -S --noconfirm ansible && \
      pacman -Scc --noconfirm

# for disable localhost warning message.
RUN /bin/echo -e "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts

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
