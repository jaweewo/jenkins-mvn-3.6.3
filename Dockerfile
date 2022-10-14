FROM jenkins/jenkins:lts-jdk11
USER root
RUN apt update && apt install -y maven
USER jenkins