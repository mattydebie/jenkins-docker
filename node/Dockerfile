FROM jenkins/agent
ARG VERSION=16
ARG UID=1000

USER root
RUN usermod -u ${UID} jenkins

# Add repos
RUN apt-get update && apt-get install -y wget curl gnupg lsb-release ssh zip &&\
    curl -sL https://deb.nodesource.com/setup_${VERSION}.x | bash - &&\
\
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add &&\
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list &&\
\
    apt-get update && apt-get install -y nodejs yarn &&\

    rm -rf /var/lib/apt


USER jenkins
