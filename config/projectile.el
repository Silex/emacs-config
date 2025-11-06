(defun silex/projectile-require-tramp (&rest _)
  "Ensure TRAMP is loaded before switching projects."
  (require 'tramp))

(use-package projectile
  :demand t
  :custom
  (projectile-keymap-prefix (kbd "C-c p"))
  (projectile-use-git-grep t)
  (projectile-switch-project-action 'projectile-dired)
  (projectile-enable-caching t)
  (projectile-mode-line '(:eval (format " Projectile[%s]" (projectile-project-name))))
  (projectile-completion-system 'default)
  :config
  (advice-add 'projectile-switch-project :before #'silex/projectile-require-tramp)
  (projectile-mode))

(use-package projectile-rails
  :demand t
  :after projectile
  :config
  (projectile-rails-global-mode)
  (define-key projectile-rails-mode-map (kbd "C-c r") 'projectile-rails-command-map))
