(use-package recentf
  :defer t
  :init
  (setq recentf-auto-cleanup 'never)
  (setq recentf-save-file "~/.emacs.d/recentf")
  (setq recentf-max-menu-items 10000)
  (setq recentf-max-saved-items nil))

(recentf-mode t)

(defun undo-kill-buffer (arg)
  "Re-open the last buffer killed.  With ARG, re-open the nth buffer."
  (interactive "p")
  (find-file (nth (1- arg) recentf-list)))
