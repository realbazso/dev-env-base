FROM ubuntu:14.04
ENV ARCH amd64
ENV DIST trusty
ENV MIRROR ftp://ftp.ubuntu.com

RUN apt-get -q update && \
	DEBIAN_FRONTEND=noninteractive && \
	apt-get -qy install openssh-server openssh-client && \
	sed -i "s/\%admin ALL=(ALL) ALL/\%admin ALL=(ALL) NOPASSWD: ALL/" /etc/sudoers

ADD run.sh /run.sh

EXPOSE 22
VOLUME ["/home"]

CMD /run.sh && tail -F /var/log/*
