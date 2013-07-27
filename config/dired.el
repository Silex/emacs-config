(require 'dired-sorting)

(defun enter-dired()
  (interactive)
  (dired ""))

(eval-after-load "dired"
  '(progn
     (toggle-diredp-find-file-reuse-dir 1)
     ))
