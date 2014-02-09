(use-package recentf
  :defer t
  :init
  (progn
    (setq recentf-auto-cleanup 'never)
    (setq recentf-max-menu-items 10000)
    (setq recentf-max-saved-items nil)))

(recentf-mode t)

(defun undo-kill-buffer (arg)
  "Re-open the last buffer killed.  With ARG, re-open the nth buffer."
  (interactive "p")
  (let ((recently-killed-list (copy-sequence recentf-list))
        (buffer-files-list
         (delq nil (mapcar (lambda (buf)
                             (when (buffer-file-name buf)
                               (expand-file-name (buffer-file-name buf)))) (buffer-list)))))
    (mapc
     (lambda (buf-file)
       (setq recently-killed-list
	     (delq buf-file recently-killed-list)))
     buffer-files-list)
    (find-file
     (if arg (nth arg recently-killed-list)
       (car recently-killed-list)))))
