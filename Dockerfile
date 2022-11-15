FROM jenkins/agent
ARG UID=1000

USER root
RUN usermod -u ${UID} jenkins

# Add repos
RUN apt-get update &&\
    apt-get install -y wget curl gnupg lsb-release ssh zip rsync &&\
    rm -rf /var/lib/apt
