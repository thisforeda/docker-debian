FROM debian:stretch-slim

COPY entry /entry

RUN apt-get update \
    && apt install -y --no-install-recommends \
      supervisor \
      openssh-server \
      vim \
      screen \
      git \
      htop \
      curl \
      rsync \
      psmisc \
      zip \
      unzip \
      netcat \
      libtool \
      dnsutils \
      inetutils-telnet \
      virtualenv \
      gcc \
      g++ \
      gcc \
      python3 \
      python3-dev \
      python3-pip \
      python3-wheel \
      python3-setuptools \
    && ln -sf /usr/bin/pip3 /usr/bin/pip \
    && ln -sf /usr/bin/python3 /usr/bin/python \
    && mkdir /var/run/sshd \
    && mkdir /root/.ssh \
    && yes | apt-get clean \
    && yes | apt-get autoclean \
    && yes | apt-get autoremove \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && chmod +x /entry

EXPOSE 22

ENTRYPOINT ["/entry"]

CMD ["/usr/sbin/sshd", "-D"]
