(use-package auto-complete
  :disabled t
  :defer t
  :init
  (setq ac-delay 0.1)
  (setq ac-auto-show-menu 0.1)
  :config
  (require 'auto-complete-config)
  (ac-config-default)
  (add-to-list 'ac-modes 'coffee-mode)
  (add-to-list 'ac-modes 'haml-mode)
  (add-to-list 'ac-modes 'shell-mode)
  :idle
  (global-auto-complete-mode))
