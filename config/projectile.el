(use-package projectile
  :defer t
  :init
  (setq projectile-remember-window-configs nil)
  (setq projectile-use-git-grep t)
  (setq projectile-switch-project-action 'enter-dired)
  (setq projectile-enable-caching t)
  :config
  (add-hook 'projectile-mode-hook 'projectile-rails-on)
  (defadvice projectile-switch-project (before require-tramp activate)
    (require 'tramp)))

(projectile-global-mode)
