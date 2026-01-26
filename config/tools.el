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

(use-package dbus
  :disabled t
  :straight nil
  :config
  ;; https://github.com/stuartleeks/wsl-notify-send
  (defun wsl-notify-send (&rest params)
    "Send a desktop notification via the WSL notify-send shim."
    (let* ((title (or (plist-get params :title) ""))
           (body (or (plist-get params :body) ""))
           (app-id (plist-get params :app-name))
           (icon (plist-get params :app-icon))
           (category (or (plist-get params :category) title))
           (args (list "wsl-notify-send.exe"
                       "--category" (if (string-empty-p category) "Emacs" category)
                       "--appId" (or app-id "Emacs")))
           (message (if (and body (not (string-empty-p body)))
                        body
                      title)))
      (when (and icon (not (string-empty-p icon)))
        (setq args (append args (list "--icon" icon))))
      (setq args (append args (list message)))
      (let ((cmd (mapconcat #'shell-quote-argument args " ")))
        (message "wsl-notify-send: %s" cmd)
        (start-process-shell-command "emacs-notify" nil cmd))))

  ;; Override `notifications-notify`
  (advice-add 'notifications-notify :override #'wsl-notify-send))
