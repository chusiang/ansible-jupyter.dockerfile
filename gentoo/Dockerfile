FROM gentoo/stage3-amd64

MAINTAINER Chu-Siang Lai <chusiang@drx.tw>

# Update the index of available packages.
RUN emerge --sync

# Install the requires portage package and python.
RUN emerge gcc dev-lang/python-2.7.12 dev-python/pip gentoolkit

# switch python to v2.7.
RUn eselect python set 1

# Upgrade the pip to lastest.
RUN pip install -U pip

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
