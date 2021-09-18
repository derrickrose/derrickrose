FROM ubuntu:latest

RUN apt-get update

WORKDIR /app

ARG BOLABOLA
ADD $BOLABOLA /app
ENTRYPOINT ["ls"]
CMD ["-l"]