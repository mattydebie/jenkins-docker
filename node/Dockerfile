FROM upthrust/jenkins-agent
ARG VERSION=16

USER root

# Add repos
RUN apt-get update &&\
    curl -sL https://deb.nodesource.com/setup_${VERSION}.x | bash - &&\
\
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add &&\
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list &&\
\
    apt-get update && apt-get install -y nodejs yarn &&\

    rm -rf /var/lib/apt


USER jenkins
