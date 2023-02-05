if [ ! -d "/home/vscode/.emacs.d" ]; then
    mkdir "/home/vscode/.emacs.d"
fi

# Configure emacs daemon to run project installation at startup
cat <<EOF >>/home/vscode/.emacs.d/init.el
;; INSTALL DEPENDENCIES
;; ---------------------------------------------
;; CONFIGURE PACKAGES
;; ---------------------------------------------
(declarative-project-mode) ;; enable global declarative project mode
(when-let ((project-spec (file-exists-p "/workspaces/source/PROJECT.yaml")))
    (declarative-project--install-project project-spec))
EOF
