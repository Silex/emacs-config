(use-package recentf
  :bind (("C-S-t" . undo-kill-buffer)
         ("S-C-r" . recentf-ido-find-file))
  :demand t
  :custom
  (recentf-auto-cleanup 'never)
  (recentf-save-file "~/.emacs.d/recentf")
  (recentf-max-menu-items 10000)
  (recentf-max-saved-items nil)
  :config
  (defun recentf-ido-find-file ()
    "Find a recent file using Ido."
    (interactive)
    (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
      (when file
        (find-file file))))

  (defun undo-kill-buffer (arg)
    "Re-open the last buffer killed.  With ARG, re-open the nth buffer."
    (interactive "p")
    (find-file (nth (1- arg) recentf-list)))

  (recentf-mode t))
