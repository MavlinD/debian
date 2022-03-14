FROM python:3.10
#FROM debian:11.2

ARG USERNAME=appuser
ENV APP_HOME=/home/$USERNAME

RUN apt update && apt install -y curl tzdata nginx systemctl gettext-base sudo acl \
&& apt install apt-transport-https ca-certificates curl gnupg lsb-release -y \
&& curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null \
&& apt update \
&& apt -y install docker-ce docker-ce-cli containerd.io \
&& pip3 install virtualenvwrapper \
&& useradd --create-home $USERNAME \
&& usermod -aG sudo $USERNAME \
&& echo "$USERNAME ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers \
&& mkdir $APP_HOME/commandhistory \
&& chown -R $USERNAME:$USERNAME $APP_HOME/commandhistory \
&& usermod -aG docker ${USERNAME} \
&& apt-get install bsdmainutils -y \
&& apt install gawk

WORKDIR $APP_HOME

USER $USERNAME

#CMD ["cron", "-f"]
