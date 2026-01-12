(defun ansi-color-buffer ()
  (interactive)
  (ansi-color-region (point-min) (point-max)))

(defun ansi-color-region (begin end)
  (interactive "r")
  (ansi-color-apply-on-region begin end))

(use-package exec-path-from-shell
  :demand t
  :config
  (setq exec-path-from-shell-variables '("PATH" "MANPATH" "SSH_AGENT_PID" "SSH_AUTH_SOCK"))
  (exec-path-from-shell-initialize))

(use-package ansi-color
  :straight nil
  :custom-face
  (ansi-color-red ((t (:foreground "#e74856"))))
  (ansi-color-green ((t (:foreground "#16c60c"))))
  (ansi-color-yellow ((t (:foreground "#f9f1a5"))))
  (ansi-color-blue ((t (:foreground "#3b78ff"))))
  (ansi-color-magenta ((t (:foreground "#d16d9e"))))
  (ansi-color-cyan ((t (:foreground "#61d6d6"))))
  (ansi-color-white ((t (:foreground "#ffffff"))))
  (ansi-color-bright-red ((t (:foreground "#ff5f6a"))))
  (ansi-color-bright-green ((t (:foreground "#3bdc3b"))))
  (ansi-color-bright-yellow ((t (:foreground "#fff1b2"))))
  (ansi-color-bright-blue ((t (:foreground "#6aa2ff"))))
  (ansi-color-bright-magenta ((t (:foreground "#e08ab3"))))
  (ansi-color-bright-cyan ((t (:foreground "#7de1e1"))))
  (ansi-color-bright-white ((t (:foreground "#ffffff")))))

(use-package eat)

;; sudo snap install cmake && sudo apt install libtool-bin
(use-package vterm
  :custom
  (vterm-max-scrollback 100000))

(use-package term
  :custom-face
  (term-color-red   ((t (:foreground "#e74856"))))
  (term-color-cyan  ((t (:foreground "#61d6d6"))))
  (term-color-green ((t (:foreground "#16c60c"))))
  (term-color-yellow ((t (:foreground "#f9f1a5"))))
  (term-color-blue  ((t (:foreground "#3b78ff"))))
  (term-color-magenta ((t (:foreground "#d16d9e"))))
  (term-color-white ((t (:foreground "#ffffff")))))

(use-package comint
  :straight nil
  :bind (:map comint-mode-map
              ("C-<up>" . nil)
              ("C-<down>" . nil))
  :custom
  (comint-scroll-to-bottom-on-input t)  ; always insert at the bottom
  (comint-scroll-to-bottom-on-output t) ; always add output at the bottom
  (comint-scroll-show-maximum-output t) ; scroll to show max possible output
  (comint-completion-autolist t)        ; show completion list when ambiguous
  (comint-input-ignoredups t)           ; no duplicates in command history
  (comint-completion-addsuffix t)       ; insert space/slash after file completion

  ;; interpret and use ansi color codes in shell output windows
  (ansi-color-for-comint-mode-on))

(use-package eshell
  :straight nil
  :config
  (defun eshell/find-files (&rest args)
    "Open a file in emacs. Some habits die hard."
    ;; We have to expand the file names or else naming a directory in an
    ;; argument causes later arguments to be looked for in that directory,
    ;; not the starting directory
    (mapc #'find-file (mapcar #'expand-file-name (eshell-flatten-list (reverse args)))))

  (defun kill-eshell ()
    (interactive)
    "Kill eshell buffer when it says \"Text is read only\""
    (let ((inhibit-read-only t)) (kill-this-buffer))))
