(defun load-directory (dir)
  "Loads every .el file in a directory in sorted order"
  (let* ((files (directory-files dir t "\\.el\\'"))
         (names (mapcar 'file-name-sans-extension files)))
    (mapc (lambda (file)
            (with-demoted-errors (load file nil t)))
          names)))

;; Initialize variables
(setq config-directory (file-name-directory (file-truename (or (buffer-file-name) load-file-name))))

;; Setup package.el
(setq package-enable-at-startup nil)
(package-initialize)
(add-to-list 'package-archives '("gnu"   . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("org"   . "http://orgmode.org/elpa/") t)

;; Install use-package if needed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Load use-package
(use-package use-package
  :init
  (setq use-package-verbose t))

;; Load configuration
(load-directory (expand-file-name "config" config-directory))
