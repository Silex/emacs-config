(use-package readline-complete
  :init
  (progn
    (setq explicit-shell-file-name "bash")
    (setq explicit-bash-args '("-c" "export EMACS=; stty echo; bash"))
    (setq comint-process-echoes t)

    (add-to-list 'ac-modes 'shell-mode)
    (add-hook 'shell-mode-hook 'ac-rlc-setup-sources)))
