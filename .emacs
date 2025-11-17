(defun load-directory (dir)
  "Load every .el file in DIR in sorted order."
  (dolist (file (directory-files dir t "\\.el\\'"))
    (with-demoted-errors "Error loading %S: %S" file
      (load (file-name-sans-extension file) nil t))))

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

(use-package emacs
  :init
  (setq config-directory (file-name-directory (file-truename (or (buffer-file-name) load-file-name))))
  (setq custom-theme-directory (expand-file-name "themes" config-directory))
  (setq custom-file (expand-file-name "custom.el" user-emacs-directory))
  (load custom-file 'noerror 'nomessage))

(use-package use-package
  :custom
  (use-package-verbose t)
  (use-package-always-ensure nil)
  (use-package-always-defer t))

(load-directory (expand-file-name "config" config-directory))
