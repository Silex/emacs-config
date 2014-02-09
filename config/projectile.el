(use-package projectile
  :defer t
  :init
  (progn
    (setq projectile-remember-window-configs t)
    (setq projectile-switch-project-action 'enter-dired))
  :config
  (defadvice projectile-switch-project (before require-tramp activate)
    (require 'tramp)))

(projectile-global-mode)
