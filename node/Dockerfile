FROM jenkins/agent
ARG VERSION=16
ARG UID=1000

USER root
RUN usermod -u ${UID} jenkins

# Add repos
RUN apt-get update && apt-get install -y wget curl gnupg lsb-release ssh zip &&\
    curl -sL https://deb.nodesource.com/setup_${VERSION}.x | bash - &&\
    apt-get update && apt-get install -y nodejs yarn &&\
    rm -rf /var/lib/apt


USER jenkins
