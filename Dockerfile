FROM debian as build
RUN apt-get update && apt-get install -y locales wget procps
RUN sysctl net.ipv6.conf.all.disable_ipv6 && wget https://docs.phreaknet.org/script/phreaknet.sh && chmod +x phreaknet.sh && ./phreaknet.sh make && phreaknet update && phreaknet install --dahdi --lightweight --alsa --fast --devmode

ENV LANG en_US.utf8
