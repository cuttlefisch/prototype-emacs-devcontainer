FROM emacs-devcontainer-base:latest
    MAINTAINER Hayden Stanko <hayden@cuttle.codes>

# Fix "Couldn't register with accessibility bus" error message
ENV NO_AT_BRIDGE=1
ENV DEBIAN_FRONTEND noninteractive

USER vscode:vscode
RUN rm -rf ~/.emacs.d
RUN git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d \
    && chmod +x ~/.emacs.d/bin/doom \
    && yes | ~/.emacs.d/bin/doom install


VOLUME ["/workspaces"]
CMD ["/bin/sh", "-c", "emacs", "--fg-daemon"]
