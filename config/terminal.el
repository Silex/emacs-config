(use-package exec-path-from-shell
  :demand t
  :config
  (exec-path-from-shell-copy-env "SSH_AGENT_PID")
  (exec-path-from-shell-copy-env "SSH_AUTH_SOCK")
  (exec-path-from-shell-initialize))

;; sudo snap install cmake && sudo apt install libtool-bin
(use-package vterm
  :custom
  (vterm-max-scrollback 100000))

(use-package term
  :custom-face
  (term-color-cyan  ((t (:foreground "#61d6d6"))))
  (term-color-green ((t (:foreground "#16c60c"))))
  (term-color-blue  ((t (:foreground "#3b78ff")))))
(use-package terminal-here
  :bind ("C-c t" . terminal-here))

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

  ;; ;; make completion buffers disappear after 3 seconds.
  ;; (add-hook 'completion-setup-hook
  ;;   (lambda () (run-at-time 3 nil
  ;;     (lambda () (delete-windows-on "*Completions*")))))

  ;; (defun buffer-killer-sentinel (process event)
  ;;   (when (equal event "finished\n")
  ;;     (kill-buffer)))

  ;; (defun kill-process-on-exit ()
  ;;   (set-process-sentinel (get-buffer-process (current-buffer)) 'buffer-killer-sentinel))

  ;;(add-hook 'shell-mode-hook 'kill-process-on-exit))

(use-package readline-complete
  :disabled t
  :straight nil
  :custom
  (explicit-bash-args '("-c" "export EMACS=; stty echo; bash"))
  (comint-process-echoes t)
  :config
  (add-to-list 'company-backends 'company-readline)
  (add-hook 'rlc-no-readline-hook (lambda () (company-mode -1))))

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
