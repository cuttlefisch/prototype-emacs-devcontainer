if [ ! -d "/home/vscode/.emacs.d" ]; then
    mkdir "/home/vscode/.emacs.d"
fi

cat <<EOF >>/home/vscode/.emacs.d/early-init.el
;; Disable package.el in favor of straight.el
(setq package-enable-at-startup nil)
EOF

# Configure emacs daemon to run project installation at startup
cat <<EOF >>/home/vscode/.emacs.d/init.el
;; INSTALL DEPENDENCIES
;; ---------------------------------------------
;; Install straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Install use-package
(straight-use-package 'use-package)

;; Configure use-package to use straight.el by default
(use-package straight
             :custom (straight-use-package-by-default t))
;; Ensure all packages are installed by default
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; Install declarative project mode
(use-package declarative-project-mode
    :straight '(declarative-project-mode
                :type git
                :host github
                :repo "cuttlefisch/declarative-project-mode"
                :files "declarative-project-mode.el"))
;; END INSTALL DEPENCIES

;; CONFIGURE PACKAGES
;; ---------------------------------------------
(declarative-project-mode) ;; enable global declarative project mode
(when-let ((project-spec (file-exists-p "/workspaces/source/PROJECT.yaml")))
    (declarative-project--install-project project-spec))
EOF
