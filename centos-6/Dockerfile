FROM centos:6

MAINTAINER Chu-Siang Lai <chusiang@drx.tw>

# Upgrade and add third-party repository.
RUN yum update -y && \
      yum install -y epel-release

# Install the requires yum package and python.
RUN yum install -y \
      python python-pip python-devel wget \
      && \
      yum clean all

# Setup the ansible.
RUN yum install -y ansible

# for disable localhost warning message.
RUN /bin/echo -e "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts

# Upgrade the pip to lastest.
RUN pip install -U pip

# Setup Python 2.7+ and Jupyter with Anaconda2.
ADD https://repo.continuum.io/archive/Anaconda2-4.2.0-Linux-x86_64.sh /home
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

