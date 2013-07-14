(defvar config-directory "")

(defun load-directory (dir)
  "Loads every .el file in a directory in sorted order"
  (mapc 'load-file (directory-files dir t "\\.el\\'")) t)

(defun edit-config ()
  "Edit the init file"
  (interactive)
  (find-file (concat config-directory "init.el")))

(defun load-config ()
  "Reload the config"
  (interactive)
  (load-file (concat config-directory "init.el")))

(defun configure-packages ()
  "Loads all files in /config"
  (interactive)
  (load-directory (concat config-directory "config")))

(defun edit-key-bindings ()
  "Edit the key bindings"
  (interactive)
  (find-file (concat config-directory "key-bindings.el")))

(defun load-key-bindings ()
  "Sets the key bindings"
  (interactive)
  (load-file (concat config-directory "key-bindings.el")))

(provide 'config)
