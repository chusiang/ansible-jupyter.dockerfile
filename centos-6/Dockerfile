FROM centos:6

MAINTAINER Chu-Siang Lai <chusiang@drx.tw>

# Install the requires yum package and python.
RUN yum update -y && \
      yum install -y epel-release

RUN yum install -y \
      kernel-headers gcc python python-pip python-devel \
      libffi-devel openssl-devel zlib-devel xz-libs wget \
      && \
      yum clean all

# Build Python 2.7
#RUN yum groupinstall -y 'development tools' && \
#      && \
#      yum clean all
#
#RUN wget https://www.python.org/ftp/python/2.7.12/Python-2.7.12.tgz && \
#      tar zxvf Python-2.7.12.tgz && \
#      cd Python-2.7.12 && \
#      ./configure --prefix=/usr/local && \
#      make && \
#      make altinstall

# Install pip 2.7
#curl https://bootstrap.pypa.io/get-pip.py | python2.7 -

# Setup the ansible.
RUN yum install -y ansible

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
