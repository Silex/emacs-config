(use-package auto-complete
  :defer t
  :init
  (progn
    (setq ac-delay 0.1)
    (setq ac-auto-show-menu 0.1))
  :config
  (progn
    (require 'auto-complete-config)
    (ac-config-default)
    (add-to-list 'ac-modes 'coffee-mode)
    (add-to-list 'ac-modes 'haml-mode))
    (add-to-list 'ac-modes 'shell-mode)
  :idle
  (global-auto-complete-mode))

(use-package readline-complete
  :defer t
  :init
  (progn
    (setq explicit-shell-file-name "bash")
    (setq explicit-bash-args '("-c" "export EMACS=; stty echo; bash"))
    (setq comint-process-echoes t)
    (add-hook 'shell-mode-hook 'ac-rlc-setup-sources)))

(use-package robe
  :defer t
  :config
  (add-hook 'robe-mode-hook 'robe-ac-setup))

