(use-package browse-kill-ring
  :ensure t
  :bind ("C-S-v" . browse-kill-ring)
  :custom
  (browse-kill-ring-quit-action 'save-and-restore))
