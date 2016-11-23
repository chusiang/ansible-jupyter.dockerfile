FROM opensuse:42.1

MAINTAINER Chu-Siang Lai <chusiang@drx.tw>

# Install the requires apt package and python.
RUN zypper update -y
RUN zypper install -y \
      kernel-devel gcc python python-pip python-devel \
      libffi-devel-gcc5 libopenssl-devel libzmq5 \
      && \
      zypper clean -a
      #libffi-devel-gcc5 libopenssl-devel xmlsec1-openssl-devel  \

# Make the Ansible 2.0+.
RUN zypper install -y \
      rpm-build make asciidoc git python-setuptools python-devel \
      python-Jinja2 python-httplib2 python-keyczar python-six python-paramiko python-yaml sshpass
RUN git clone git://github.com/ansible/ansible.git --recursive
RUN cd ansible/ && make rpm && \
      rpm -ivh rpm-build/ansible-*.git*.noarch.rpm

# for disable localhost warning message.
RUN /bin/echo -e "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts

# Upgrade the pip to lastest.
RUN pip install -U pip

# Setup with Anaconda2.
#ADD https://repo.continuum.io/archive/Anaconda2-4.2.0-Linux-x86_64.sh
COPY Anaconda2-4.2.0-Linux-x86_64.sh /home
RUN bash /home/Anaconda2-4.2.0-Linux-x86_64.sh -b -f -p /opt/anaconda2 && \
      rm -f /home/Anaconda2-4.2.0-Linux-x86_64.sh && \
      echo "PATH=$PATH:/opt/anaconda2/bin/:/opt/anaconda2/sbin/" > ~/.bashrc

# Copy a ipython notebook example to image.
ADD https://raw.githubusercontent.com/chusiang/ansible-jupyter.dockerfile/master/ipynb/ansible_on_jupyter.ipynb /home/

# Run service of Jupyter.
COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT [ "docker-entrypoint.sh" ]
EXPOSE 8888

CMD [ "jupyter", "--version" ]
