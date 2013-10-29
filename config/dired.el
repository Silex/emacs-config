(defun enter-dired()
  (interactive)
  (dired ""))

(defun dired-do-find-marked-files-and-select-in-ibuffer ()
  "Open marked files in ibuffer and select them."
  (interactive)
  (let ((current (current-buffer)))
    (dired-map-over-marks
     (let* ((filename (dired-get-file-for-visit))
            (buffer (find-file-noselect filename)))
       (message "YEAH %s" filename)
       ;; Select buffer in ibuffer
       (ibuffer)
       (ibuffer-mark-on-buffer #'(lambda (buf)
                                   (eq buf buffer)))
       ;; Go back to dired
       (switch-to-buffer current))
     nil)

    ;; Remove other buffers from ibuffer listing
    (ibuffer)
    (ibuffer-toggle-marks)
    (ibuffer-do-kill-lines)
    (ibuffer-toggle-marks)))

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

;; Inspired from http://www.emacswiki.org/emacs/DiredOmitMode
(defun dired-hide-dotfiles ()
  "Hide dotfiles"
  (interactive)
  (when (equal major-mode 'dired-mode)
    (progn
      (set (make-local-variable 'dired-dotfiles-show-p) nil)
      (dired-mark-files-regexp "^\\\.")
      (dired-do-kill-lines))))

(use-package dired+
  :commands toggle-diredp-find-file-reuse-dir)

(use-package dired
  :commands (dired
             dired-jump
             find-name-dired
             find-dired)
  :config
  (progn
    (toggle-diredp-find-file-reuse-dir 1)
    ;; Enable R key in dired to use ido
    (put 'dired-do-rename 'ido 'find-file)))
