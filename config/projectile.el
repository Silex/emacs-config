(use-package projectile
  :ensure t
  :custom
  (projectile-keymap-prefix (kbd "C-p"))
  (projectile-use-git-grep t)
  (projectile-switch-project-action 'projectile-dired)
  (projectile-enable-caching t)
  (projectile-mode-line '(:eval (format " Projectile[%s]" (projectile-project-name))))
  :config
  (defadvice projectile-switch-project (before require-tramp activate)
    (require 'tramp)
    (ignore-errors (ad-remove-advice 'projectile-switch-project 'before 'require-tramp)))
  (projectile-mode))

(use-package projectile-rails
  :ensure t
  :after projectile
  :config
  (projectile-rails-global-mode))
