FROM ubuntu:14.04

MAINTAINER b225ccc@gmail.com

# install dependencies
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y curl git supervisor && \
  apt-get install -y libxslt1-dev libxslt1.1 libxml2-dev \
    libxml2 libssl-dev libffi-dev python-pip python-dev libssl-dev && \
  rm -rf /var/lib/apt/lists/*

RUN \
  mkdir -p /var/log/supervisor

# build unrar
RUN \
  cd /tmp && \
  curl -o unrarsource.tar.gz http://rarlab.com/rar/unrarsrc-5.2.7.tar.gz && \
  tar -xvf /tmp/unrarsource.tar.gz && \
  cd unrar && \
  make -f makefile && \
  install -v -m755 unrar /usr/bin && \
  rm -rf /tmp/unrar*

# create headphones user and add media group
# user will default to the 'nogroup' group
RUN \
  groupadd --system --gid 1001 media && \
  adduser --system --uid 65003 --no-create-home headphones && \
  usermod -aG media headphones

# add custom files
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

RUN \
  git clone -q https://github.com/rembo10/headphones.git /opt/headphones && \
  chown headphones:nogroup -R /opt/headphones

# volumes
VOLUME /config /downloads /music

# ports
EXPOSE 8181

CMD ["/usr/local/bin/run.sh"]
