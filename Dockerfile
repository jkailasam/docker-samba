FROM jeeva420/xenial-base
MAINTAINER Jeeva Kailasam <kjeeva@ymail.com>

# Set correct environment variables
ARG BASE_APTLIST="samba"
ARG DEBIAN_FRONTEND="noninteractive"

# install main packages
RUN apt-get update -q && \
apt-get install $BASE_APTLIST -qy && \
# cleanup 
apt-get autoremove -y && \
apt-get clean -y && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# add some files 
RUN echo "copying folders and files from the project"
ADD defaults/ /defaults/
ADD etc/cont-init.d/ /etc/cont-init.d/
ADD etc/services.d/ /etc/services.d/
#ADD etc/fix-attrs.d/ /etc/fix-attrs.d/
RUN chmod -v +x /etc/services.d/*/run /etc/cont-init.d/*.sh


# expose ports
#EXPOSE 138/udp 139 445 445/udp

# set volumes
VOLUME /config
