FROM jenkins/jenkins:2.346.3-2-jdk8
USER root
RUN apt update && apt install -y maven ca-certificates curl gnupg lsb-release && mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
RUN echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get -y install docker-ce docker-ce-cli && service docker start && service docker status
RUN usermod -aG docker jenkins
USER jenkins
