(use-package recentf
  :commands (recentf-mode
             recentf-open-files)
  :init
  (progn
    (setq recentf-max-menu-items 10000)
    (setq recentf-max-saved-items nil)))

(recentf-mode t)
