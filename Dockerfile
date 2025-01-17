# FROM jenkins:2.60.3

# USER root
# COPY . .
# RUN apt-get update && apt-get install -y ruby
# USER jenkins

FROM jenkins/jenkins:2.289.1-lts-jdk11
USER root
RUN apt-get update && apt-get install -y apt-transport-https \
       ca-certificates curl gnupg2 \
       software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN apt-key fingerprint 0EBFCD88
RUN add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/debian \
       $(lsb_release -cs) stable"
RUN apt-get update && apt-get install -y docker-ce-cli
RUN apt-get install curl -y
RUN curl -fsSL https://deb.nodesource.com/setup_16.x
RUN apt-get update
RUN apt-get install -y nodejs
RUN apt-get update
RUN apt-get install docker-ce -y
RUN usermod -a -G docker jenkins
USER jenkins
RUN jenkins-plugin-cli --plugins "blueocean:1.24.7 docker-workflow:1.26"