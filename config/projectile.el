(use-package projectile
  :commands (projectile-mode
             projectile-global-mode)
  :init
  (progn
    (setq projectile-switch-project-action 'enter-dired)))

(projectile-global-mode)
