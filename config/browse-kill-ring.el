(use-package browse-kill-ring
  :ensure t
  :bind ("C-S-v" . browse-kill-ring)
  :init
  (setq browse-kill-ring-quit-action 'save-and-restore))
