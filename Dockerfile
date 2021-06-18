FROM jenkins:2.60.3-alpine

USER root
RUN apk update && apk add ruby

CMD /bin/tini -s -- /usr/local/bin/jenkins.sh --httpPort=$PORT

EXPOSE 8080