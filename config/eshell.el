(defun eshell/find-files (&rest args)
  "Open a file in emacs. Some habits die hard."
  ;; We have to expand the file names or else naming a directory in an
  ;; argument causes later arguments to be looked for in that directory,
  ;; not the starting directory
  (mapc #'find-file (mapcar #'expand-file-name (eshell-flatten-list (reverse args)))))
