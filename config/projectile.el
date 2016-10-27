(use-package projectile-rails :ensure t :defer t)

(use-package projectile
  :ensure t
  :init
  (setq projectile-keymap-prefix (kbd "C-p"))
  (setq projectile-use-git-grep t)
  (setq projectile-switch-project-action 'projectile-dired)
  (setq projectile-enable-caching t)
  :config
  (add-hook 'projectile-mode-hook 'projectile-rails-on)
  (defadvice projectile-switch-project (before require-tramp activate)
    (require 'tramp)
    (ignore-errors (ad-remove-advice 'projectile-switch-project 'before 'require-tramp)))
  (projectile-mode))
