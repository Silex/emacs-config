(use-package multi-term
  :ensure t
  :defer t
  :init
  (setq multi-term-program-switches "--login"))

(use-package terminal-here
  :bind ("C-t" . terminal-here)
  :ensure t)

(use-package comint
  :bind (:map comint-mode-map
              ("C-<up>" . nil)
              ("C-<down>" . nil))
  :init
  (setq comint-scroll-to-bottom-on-input t)  ; always insert at the bottom
  (setq comint-scroll-to-bottom-on-output t) ; always add output at the bottom
  (setq comint-scroll-show-maximum-output t) ; scroll to show max possible output
  (setq comint-completion-autolist t)        ; show completion list when ambiguous
  (setq comint-input-ignoredups t)           ; no duplicates in command history
  (setq comint-completion-addsuffix t)       ; insert space/slash after file completion

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
  :defer t
  :init
  (setq explicit-shell-file-name "bash")
  (setq explicit-bash-args '("-c" "export EMACS=; stty echo; bash"))
  (setq comint-process-echoes t)
  :config
  (add-to-list 'company-backends 'company-readline)
  (add-hook 'rlc-no-readline-hook (lambda () (company-mode -1))))
