;;; tools.el --- Tools, services, and integrations  -*- lexical-binding: t; -*-

(use-package atomic-chrome
  :demand t
  :straight (atomic-chrome :repo "KarimAziev/atomic-chrome" :type git :flavor nil :host github)
  :custom
  (atomic-chrome-url-major-mode-alist '(("github\\.com" . gfm-mode)
                                        ("redmine" . textile-mode)))
  :config
  (atomic-chrome-start-server))

(use-package docker
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

;; https://github.com/stuartleeks/wsl-notify-send
(defun silex/notify-windows-toast (&rest params)
  "Show the notification in PARAMS as a Windows toast.
PARAMS are the keyword arguments of `notifications-notify'; only
:title, :body, :app-name and :app-icon are used."
  (let* ((title (or (plist-get params :title) ""))
         (body (or (plist-get params :body) ""))
         (icon (plist-get params :app-icon)))
    (apply #'start-process "wsl-notify-send" nil "wsl-notify-send.exe"
           "--appId" (or (plist-get params :app-name) "Emacs")
           "--category" (if (string-empty-p title) "Emacs" title)
           (append (and icon (not (string-empty-p icon)) (list "--icon" icon))
                   (list (if (string-empty-p body) title body))))
    nil))

(use-package notifications
  :straight nil
  :config
  ;; dunst under WSLg opens each popup as a Windows window, which takes the
  ;; focus away from Emacs; a toast does not.
  (advice-add 'notifications-notify :override #'silex/notify-windows-toast))
