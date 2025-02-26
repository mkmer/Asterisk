
FROM mcr.microsoft.com/devcontainers/cpp:dev-debian12 as build
SHELL ["/bin/bash", "-c"]
ENV REL_VER="1.0.0"
ENV AST_VER="22.2.0"
ENV RPT_VER="3.2.0"
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y locales \
    procps git lsb-release sudo patch apt-utils build-essential \
    devscripts fakeroot debhelper git gh ca-certificates
RUN sysctl net.ipv6.conf.all.disable_ipv6 && \
    mkdir /workspaces && \
    cd /workspaces && \
    ls -la && \
    git clone https://github.com/AllStarLink/asl3-asterisk.git && \
    ls -la ./asl3-asterisk
WORKDIR /workspaces/asl3-asterisk
RUN ./build-asl3 -l -d /workspaces -a $AST_VER -v $RPT_VER -r $REL_VER source

ENV LANG en_US.utf8
