(use-package projectile
  :defer t
  :init
  (setq projectile-remember-window-configs t)
  (setq projectile-use-git-grep t)
  (setq projectile-switch-project-action 'enter-dired)
  :config
  (defadvice projectile-switch-project (before require-tramp activate)
    (require 'tramp)))

(projectile-global-mode)
