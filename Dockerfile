FROM jenkins/jenkins:lts-jdk11
USER root
apt update && apt install -y maven