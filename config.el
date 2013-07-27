(defvar config-directory "")

(defun load-directory (dir)
  "Loads every .el file in a directory in sorted order"
  (mapc 'load-file (directory-files dir t "\\.el\\'")) t)

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

(defun edit-key-bindings ()
  "Edit the key bindings"
  (interactive)
  (find-file (expand-file-name "key-bindings.el" config-directory)))

(defun load-key-bindings ()
  "Sets the key bindings"
  (interactive)
  (load-file (expand-file-name "key-bindings.el" config-directory)))

(provide 'config)
