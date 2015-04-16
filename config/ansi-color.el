(defun ansi-color-buffer ()
  (interactive)
  (ansi-color-region (point-min) (point-max)))

(defun ansi-color-region (begin end)
  (interactive "r")
  (ansi-color-apply-on-region begin end))
