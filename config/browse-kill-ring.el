(use-package browse-kill-ring
  :bind ("C-S-v" . browse-kill-ring)
  :custom
  (browse-kill-ring-quit-action 'save-and-restore))
