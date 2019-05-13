FROM debian:stretch-slim

COPY entry /entry

RUN apt-get update \
    && apt-get -y upgrade \
    && apt install -y --no-install-recommends \
      cron \
      supervisor \
      openssh-server \
      sudo \
      rsync \
      rsyslog \
      vim \
      screen \
      git \
      curl \
      zip \
      unzip \
      virtualenv \
      gcc \
      netcat \
      python-pip \
      python3-pip \
      python-dev \
      python3-dev \
      python-wheel \
      python3-wheel \
      python-setuptools \
      python3-setuptools \
    && [ -e /usr/bin/python ] || ln -sf /usr/bin/python2 /usr/bin/python \
    && mkdir /var/run/sshd \
    && mkdir /root/.ssh \
    && yes | apt-get clean \
    && yes | apt-get autoclean \
    && yes | apt-get autoremove \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && chown root:root /entry \
    && chmod 755 /entry

EXPOSE 22

ENTRYPOINT ["/entry"]

CMD ["/usr/sbin/sshd", "-D"]
