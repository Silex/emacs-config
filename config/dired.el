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

;; Taken from http://www.emacswiki.org/emacs/DiredOmitMode
(defun dired-toggle-dotfiles ()
  "Show/hide dot-files"
  (interactive)
  (when (equal major-mode 'dired-mode)
    (if (or (not (boundp 'dired-dotfiles-show-p)) dired-dotfiles-show-p) ; if currently showing
        (progn
          (set (make-local-variable 'dired-dotfiles-show-p) nil)
          (dired-mark-files-regexp "^\\\.")
          (dired-do-kill-lines))
      (revert-buffer) ; otherwise just revert to re-show
      (set (make-local-variable 'dired-dotfiles-show-p) t))))

(eval-after-load 'dired
  '(progn
     (toggle-diredp-find-file-reuse-dir 1)
     ))
