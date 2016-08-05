(defvar config-directory "")

(defun load-directory (dir)
  "Loads every .el file in a directory in sorted order"
  (let* ((files (directory-files dir t "\\.el\\'"))
         (names (mapcar 'file-name-sans-extension files)))
    (mapc (lambda(file)
            (with-demoted-errors (load file nil t)))
          names))
  t)

(defun edit-config ()
  "Edit the init file"
  (interactive)
  (find-file (expand-file-name "init.el" config-directory)))

(defun load-config ()
  "Reload the config"
  (interactive)
  (load-file (expand-file-name "init.el" config-directory)))

(defun configure-packages ()
  "Loads all files in /config"
  (interactive)
  (load-directory (expand-file-name "config" config-directory)))

(provide 'config)
