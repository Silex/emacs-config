(defun load-directory (dir)
  "Loads every .el file in a directory in sorted order"
  (let* ((files (directory-files dir t "\\.el\\'"))
         (names (mapcar #'file-name-sans-extension files)))
    (mapc (lambda (file)
            (with-demoted-errors (load file nil t)))
          names)))

;; Bootstrap straight.el
(setq package-enable-at-startup nil)
(setq straight-use-package-by-default t)
(defvar bootstrap-version)
(let ((bootstrap-file (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
      (url-retrieve-synchronously
        "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
        'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(require 'use-package)

;; Load use-package
(use-package use-package
  :custom
  (use-package-verbose t)
  (use-package-always-ensure nil)
  (use-package-always-defer t))

;; Load configuration
(setq config-directory (file-name-directory (file-truename (or (buffer-file-name) load-file-name))))
(setq custom-theme-directory (concat config-directory "themes"))
(setq custom-file "~/.emacs.d/custom.el")
(load-directory (expand-file-name "config" config-directory))
