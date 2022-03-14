#FROM docker:git
#FROM docker:20.10.13
#FROM python:3.9.10
#FROM nginx
FROM debian:11.2

ARG USERNAME=appuser
ENV APP_HOME=/home/$USERNAME

ARG DOCKER_VERSION=20.10.9
#Linux:   https://download.docker.com/linux/static

RUN apt update && apt install -y curl tzdata nginx systemctl gettext-base sudo acl \
#&& apt-transport-https ca-certificates curl gnupg2 software-properties-common \
#&& curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
&& apt install apt-transport-https ca-certificates curl gnupg lsb-release -y \
&& curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
     $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null \
&& apt update \
&& apt -y install docker-ce docker-ce-cli containerd.io \
  && useradd --create-home $USERNAME \
  && usermod -aG sudo $USERNAME \
  && echo "$USERNAME ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers \
  && mkdir $APP_HOME/commandhistory \
  && chown -R $USERNAME:$USERNAME $APP_HOME/commandhistory \
##  && pip3 install virtualenvwrapper \
  && usermod -aG docker ${USERNAME}

#    RUN service docker enable \
#        && service containerd.service enable
#    && systemctl enable docker.service \
#        && sudo systemctl enable containerd.service



#CMD service docker start
#RUN apt update && apt install -y curl tzdata nginx systemctl gettext-base sudo acl \
#  && cd /tmp/ \
#  && curl -sSL -O https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz \
#  && tar zxf docker-${DOCKER_VERSION}.tgz \
#  && mkdir -p /usr/local/bin/ \
#  && mv /tmp/docker/docker /usr/local/bin/ \
#  && chmod +x /usr/local/bin/docker \
#RUN useradd --create-home $USERNAME \
#  && usermod -aG sudo $USERNAME \
#  && echo "$USERNAME ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers \
#  && mkdir $APP_HOME/commandhistory \
#  && chown -R $USERNAME:$USERNAME $APP_HOME/commandhistory
#  && pip3 install virtualenvwrapper \
#  && groupadd docker && usermod -aG docker ${USERNAME}

WORKDIR $APP_HOME
#RUN #chown -R $USERNAME:$USERNAME $APP_HOME

USER $USERNAME
