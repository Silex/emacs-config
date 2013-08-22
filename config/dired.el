(require 'dired-sorting)

(defun enter-dired()
  (interactive)
  (dired ""))

(defun dired-do-eval (form)
  "Evaluate FORM in each of the buffers."
  (interactive (list (read-from-minibuffer "Eval in files (form): " nil read-expression-map t 'read-expression-history)))
  (dired-map-over-marks
   (let* ((filename (dired-get-file-for-visit))
          (buf (find-file-noselect filename))
          (kill-buffer-query-functions nil))
     (unwind-protect
         (with-current-buffer buf (eval form lexical-binding)(save-buffer))
       (kill-buffer buf))) nil))

(eval-after-load "dired"
  '(progn
     (toggle-diredp-find-file-reuse-dir 1)
     ))
