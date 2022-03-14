FROM python:3.9.10
#FROM debian:11.2

ARG USERNAME=appuser
ENV APP_HOME=/home/$USERNAME

ARG DOCKER_VERSION=20.10.9
#Linux:   https://download.docker.com/linux/static

RUN apt update && apt install -y curl tzdata nginx systemctl gettext-base sudo acl \
  && cd /tmp/ \
  && curl -sSL -O https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz \
  && tar zxf docker-${DOCKER_VERSION}.tgz \
  && mkdir -p /usr/local/bin/ \
  && mv /tmp/docker/docker /usr/local/bin/ \
  && chmod +x /usr/local/bin/docker \
  && useradd --create-home $USERNAME \
  && usermod -aG sudo $USERNAME \
  && echo "$USERNAME ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers \
  && mkdir $APP_HOME/commandhistory \
  && chown -R $USERNAME:$USERNAME $APP_HOME/commandhistory \
  && pip3 install virtualenvwrapper \
  && groupadd docker && usermod -aG docker ${USERNAME}

WORKDIR $APP_HOME
#RUN #chown -R $USERNAME:$USERNAME $APP_HOME

USER $USERNAME
