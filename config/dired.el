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

(use-package dired
  :ensure nil
  :bind (:map dired-mode-map
              ("<backspace>" . dired-jump)
              ("E" . dired-do-eval)
              ("F" . dired-do-find-marked-files-and-select-in-ibuffer))
  :custom
  (dired-recursive-copies 'always)
  (dired-recursive-deletes 'always)
  (dired-listing-switches "-alh")
  (dired-dwim-target t)
  :config
  (put 'dired-find-alternate-file 'disabled nil))

(use-package dired-x
  :ensure nil
  :bind ("C-d" . dired-jump))

(use-package dired-filter
  :after dired
  :custom (dired-filter-mark-prefix "*"))

(use-package dired-quick-sort
  :after dired
  :bind (:map dired-mode-map
              ("s" . hydra-dired-quick-sort/body)))

(use-package dired-launch
  :after dired
  :init
  (add-hook 'dired-mode-hook 'dired-launch-mode))

(use-package dired-ranger)
(use-package dired-subtree)
(use-package dired-imenu :after dired)
(use-package dired-du)

(use-package tar-mode
  :custom (tar-mode-show-date t))

(use-package wdired
  :custom
  (wdired-create-parent-directories t))
