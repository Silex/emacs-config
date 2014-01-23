(use-package auto-complete
  :commands (global-auto-complete-mode
             auto-complete-mode
             auto-complete)
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
  :idle
  (global-auto-complete-mode))

(use-package robe-ac
  :commands robe-ac-setup)

(use-package robe
  :command robe-mode
  :config
  (add-hook 'robe-mode-hook 'robe-ac-setup))

