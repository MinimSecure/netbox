FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y build-essential libtool pkg-config cmake ncurses-dev gawk automake

RUN apt-get install -y git subversion net-tools dnsutils

RUN apt-get install -y vim iputils-ping bridge-utils

RUN apt-get install -y iperf curl wget

WORKDIR /root

COPY ./iperf_rand.sh .

CMD ["/bin/bash"]
