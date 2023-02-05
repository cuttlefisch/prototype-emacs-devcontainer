if [ ! -d "/home/vscode/.emacs.d" ]; then
    mkdir "/home/vscode/.emacs.d"
fi

cat <<EOF >>/home/vscode/.emacs.d/early-init.el
;; Disable package.el in favor of straight.el
(setq package-enable-at-startup nil)
EOF

# Configure emacs daemon to run project installation at startup
cat <<EOF >>/home/vscode/.emacs.d/init.el
;; Install declarative project mode
(use-package declarative-project-mode
    :straight '(declarative-project-mode
                :type git
                :host github
                :repo "cuttlefisch/declarative-project-mode"))
                ;:files "declarative-project-mode.el")
;; END INSTALL DEPENCIES

;; CONFIGURE PACKAGES
;; ---------------------------------------------
(declarative-project-mode) ;; enable global declarative project mode
(let ((default-project-file  "/workspaces/source/PROJECT.yaml"))
    (when (file-exists-p default-project-file)
        (declarative-project--install-project default-project-file)))
EOF
