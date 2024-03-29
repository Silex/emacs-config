(use-package projectile
  :demand t
  :custom
  (projectile-keymap-prefix (kbd "C-c p"))
  (projectile-use-git-grep t)
  (projectile-switch-project-action 'projectile-dired)
  (projectile-enable-caching t)
  (projectile-mode-line '(:eval (format " Projectile[%s]" (projectile-project-name))))
  (projectile-completion-system 'ivy)
  :config
  (defadvice projectile-switch-project (before require-tramp activate)
    (require 'tramp)
    (ignore-errors (ad-remove-advice 'projectile-switch-project 'before 'require-tramp)))
  (projectile-mode))

(use-package counsel-projectile
  :disabled t
  :after projectile
  :config (counsel-projectile-mode))

(use-package projectile-rails
  :after projectile
  :demand t
  :config
  (projectile-rails-global-mode)
  (define-key projectile-rails-mode-map (kbd "C-c r") 'projectile-rails-command-map))
