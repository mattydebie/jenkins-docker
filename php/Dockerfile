FROM jenkins/agent
ARG VERSION=8.0
ARG UID=1000

RUN usermod -u ${UID} jenkins

USER root

# Add repos
RUN apt-get update && apt-get install -y wget gnupg lsb-release &&\
    wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add - &&\
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/sury-php.list &&\
    apt-get update && apt-get install -y php${VERSION} php${VERSION}-mbstring php${VERSION}-xml php${VERSION}-gd php${VERSION}-curl php${VERSION}-zip &&\
    rm -rf /var/lib/apt

# Install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" &&\
    php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" &&\
    php composer-setup.php && php -r "unlink('composer-setup.php');" && mv composer.phar /usr/local/bin/composer

USER jenkins
