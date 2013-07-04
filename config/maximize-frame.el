(defun maximize-frame ()
  (interactive)
  (set-frame-parameter nil 'fullscreen 'maximized))

(defun restore-frame ()
  (interactive)
  (set-frame-parameter nil 'fullscreen nil))
