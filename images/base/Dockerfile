FROM mcr.microsoft.com/vscode/devcontainers/base:debian
    MAINTAINER Hayden Stanko <hayden@cuttle.codes>

# Fix "Couldn't register with accessibility bus" error message
ENV NO_AT_BRIDGE=1
ENV DEBIAN_FRONTEND noninteractive

USER vscode:vscode
RUN sudo apt-get update && sudo apt-get upgrade -y \
    && sudo apt-get install -y build-essential texinfo libx11-dev libxpm-dev libjpeg-dev libpng-dev libgif-dev libtiff-dev libgtk2.0-dev libncurses-dev gnutls-bin libgnutls28-dev \
    && sudo git clone https://github.com/emacs-mirror/emacs /tmp/emacs \
    && cd /tmp/emacs \
    && sudo ./autogen.sh \
    && sudo ./configure \
    && sudo make bootstrap \
    && sudo make install \
    && sudo rm -rf /tmp/emacs

RUN git clone https://github.com/cuttlefisch/prototype-emacs-devcontainer --branch project-install-experiments /tmp/provisioning \
    && cd /tmp/provisioning \
    && cd /tmp/provisioning \
    && sh build-resources/install-base.sh \
    && rm -rf /tmp/provisioning

RUN mkdir /home/vscode/workspaces

VOLUME ["/workspaces"]
CMD ["/bin/sh", "-c", "emacs", "--fg-daemon"]
