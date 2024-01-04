FROM kalilinux/kali-rolling:latest
LABEL maintainer="andassis@gmail.com"
WORKDIR /root
RUN apt update && \
apt -y upgrade
RUN DEBIAN_FRONTEND=noninteractive apt -yq install \
  dialog \
  firefox-esr \
  inetutils-ping \
  htop \
  nano \
  net-tools \
  tigervnc-standalone-server \
  tigervnc-xorg-extension \
  tigervnc-viewer \
  novnc
RUN DEBIAN_FRONTEND=noninteractive apt -yq install \
  dbus-x11 \
  xfce4-session \
  xfce4-goodies \
  kali-linux-large \
  kali-desktop-xfce
RUN apt -y dist-upgrade && \
apt -y autoremove && \
apt clean all
# Instalação do Sn1per
RUN git clone https://github.com/1N3/Sn1per /opt/sn1per && \
    cd /opt/sn1per && \
    bash install.sh
COPY startup.sh /startup.sh
ENV PASSWORD=kalilinux
ENV SHELL=/bin/bash
EXPOSE 8080
ENTRYPOINT ["/bin/bash", "/startup.sh"]
