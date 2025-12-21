;; Tools, services, and integrations

(use-package atomic-chrome
  :demand t
  :straight (atomic-chrome :repo "KarimAziev/atomic-chrome" :type git :flavor nil :host github)
  :custom
  (atomic-chrome-url-major-mode-alist '(("github\\.com" . gfm-mode)
                                        ("redmine" . textile-mode)))
  :config
  (atomic-chrome-start-server))

(use-package docker
  :custom
  (docker-run-async-with-buffer-function 'docker-run-async-with-buffer-vterm)
  :bind ("C-c d" . docker))

(use-package edit-server
  :straight nil
  :custom
  (edit-server-url-major-mode-alist '(("github\\.com" . gfm-mode)))
  :config
  (edit-server-start))

(use-package diff-mode
  :straight nil
  :init
  (custom-set-faces
   '(diff-added ((t (:foreground "Green"))) 'now)
   '(diff-removed ((t (:foreground "Red"))) 'now)))

(use-package ediff
  :straight nil
  :custom
  ;; Split window horizontally by default
  (ediff-split-window-function 'split-window-horizontally)
  ;; Don't popup a new frame when ediffing
  (ediff-window-setup-function 'ediff-setup-windows-plain))

(use-package chronos)
(use-package google-translate)
(use-package hookify)
(use-package htmlize)
(use-package impatient-mode)
(use-package pkg-info)
(use-package request)
(use-package suggest)
(use-package benchmark-init)
(use-package disk-usage)
(use-package firestarter)
