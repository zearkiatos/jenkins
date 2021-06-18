FROM jenkins:2.60.3

USER root
RUN apt-get update && apt-get install -y ruby
USER jenkins
