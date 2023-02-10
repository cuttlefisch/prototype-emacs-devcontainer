FROM emacs-devcontainer-base:latest
    MAINTAINER Hayden Stanko <hayden@cuttle.codes>

# Fix "Couldn't register with accessibility bus" error message
ENV NO_AT_BRIDGE=1
ENV DEBIAN_FRONTEND noninteractive

USER vscode:vscode
RUN git clone https://github.com/cuttlefisch/prototype-emacs-devcontainer --branch debug-project-install /tmp/provisioning \
    && cd /tmp/provisioning \
    && cd /tmp/provisioning \
    && sh build-resources/install-projects.sh \
    && rm -rf /tmp/provisioning


VOLUME ["/workspaces"]
CMD ["/bin/sh", "-c", "emacs", "--fg-daemon"]
