FROM jenkins:2.60.3-alpine

USER root
RUN apk update && apk add ruby
USER jenkins # drop back to the regular jenkins user - good practice