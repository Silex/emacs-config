(use-package recentf
  :bind ("C-S-t" . undo-kill-buffer)
  :demand t
  :custom
  (recentf-auto-cleanup 'never)
  (recentf-save-file "~/.emacs.d/recentf")
  (recentf-max-menu-items 10000)
  (recentf-max-saved-items nil)
  :config
  (defun undo-kill-buffer (arg)
    "Re-open the last buffer killed.  With ARG, re-open the nth buffer."
    (interactive "p")
    (find-file (nth (1- arg) recentf-list)))

  (recentf-mode t))
