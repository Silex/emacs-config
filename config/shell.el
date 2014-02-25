(use-package readline-complete
  :defer t
  :init
  (setq explicit-shell-file-name "bash")
  (setq explicit-bash-args '("-c" "export EMACS=; stty echo; bash"))
  (setq comint-process-echoes t))

(use-package comint
  :defer t
  :init

  (defun buffer-killer-sentinel (process event)
    (kill-buffer))

  (defun kill-process-on-exit ()
    (set-process-sentinel (get-buffer-process (current-buffer)) 'buffer-killer-sentinel))

  (add-hook 'shell-mode-hook 'kill-process-on-exit))
