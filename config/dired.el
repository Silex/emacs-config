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

(defun dired-toggle-dwim-target ()
  (interactive)
  "Toggles `dired-dwim-target'."
  (setq dired-dwim-target (not dired-dwim-target))
  (message "Dired DWIM is %s" (if dired-dwim-target "ON" "OFF")))

(defun dired-zip (filename &optional arg file-list)
  (interactive
   (let ((files (dired-get-marked-files t current-prefix-arg)))
     (list
      (read-string "zip filename: ")
      current-prefix-arg
      files)))
  (dired-do-async-shell-command (concat "zip " filename " *") arg file-list))

(defun dired-unzip (&optional doit arg file-list)
  (interactive
   (let ((files (dired-get-marked-files t current-prefix-arg)))
     (list
      ;; Want to give feedback whether this file or marked files are used:
      ;;(y-or-n-p (format "unzip on %s: " current-prefix-arg files))
      (y-or-n-p "unzip files?") ;; FIXME
      current-prefix-arg
      files)))
  (dired-do-async-shell-command "unzip" arg file-list))

(use-package dired-x
  :bind ("C-d" . dired-jump))

(use-package dired-filter
  :ensure t
  :defer t
  :init (setq dired-filter-mark-prefix "*"))

(use-package dired-quick-sort
  :ensure t
  :bind (:map dired-mode-map
              ("s" . hydra-dired-quick-sort/body)))

(use-package dired-launch
  :ensure t
  :defer t
  :init
  (add-hook 'dired-mode-hook 'dired-launch-mode))

(use-package dired-ranger :ensure t :defer t)
(use-package dired-subtree :ensure t :defer t)

(use-package dired
  :bind (:map dired-mode-map
              ("C-c w" . wdired-change-to-wdired-mode)
              ("<backspace>" . dired-jump)
              ("E" . dired-do-eval)
              ("F" . dired-do-find-marked-files-and-select-in-ibuffer))
  :init
  (setq dired-recursive-copies 'always)
  (setq dired-recursive-deletes 'always)
  (setq dired-listing-switches "-alh")
  (setq dired-dwim-target t)
  :config
  (require 'dired-filter)
  (put 'dired-find-alternate-file 'disabled nil))
