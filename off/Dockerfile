FROM alpine:3.15

LABEL maintainer="Mavlin Dm. <mavlind@list.ru>"
LABEL date="2022-03-10"

ARG USERNAME=appuser
ARG DOCKER_VERSION=20.10.9
ARG HOME_DIR=/home/$USERNAME
#Linux:   https://download.docker.com/linux/static

RUN apk --update add bash curl tzdata \
  && cd /tmp/ \
  && curl -sSL -O https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz \
  && tar zxf docker-${DOCKER_VERSION}.tgz \
  && mkdir -p /usr/local/bin/ \
  && mv /tmp/docker/docker /usr/local/bin/ \
  && chmod +x /usr/local/bin/docker \
  && apk del curl \
  && rm -rf /tmp/* \
  && rm -rf /var/cache/apk/*
#  && useradd --create-home $USERNAME && \
#  usermod -aG sudo $USERNAME && \
#  echo "$USERNAME ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
# Create a group and user
RUN apk add --update busybox-suid
# install cap package and set the capabilities on busybox
RUN apk add --update --no-cache libcap && \
    setcap cap_setgid=ep /bin/busybox
#USER root
RUN apk add sudo
RUN addgroup sudo && adduser -s bash -S $USERNAME -G root
#RUN addgroup -S $USERNAME && adduser -s bash -S $USERNAME -G $USERNAME

#ARG NEWUSER='appuser2'
#RUN adduser -S $USERNAME $USERNAME
RUN echo "$USERNAME ALL=(ALL) ALL" > /etc/sudoers.d/$USERNAME && chmod 0440 /etc/sudoers.d/$USERNAME

COPY .bashrc /root
USER $USERNAME
#USER cron
COPY scripts /root/scripts
COPY crontab .
RUN crontab crontab
CMD crond -f
#RUN crontab crontab && \
#    mkdir /commandhistory && \
#    chown $USERNAME:$USERNAME /commandhistory
COPY --chown=$USERNAME:$USERNAME .bashrc $HOME_DIR
WORKDIR $HOME_DIR

