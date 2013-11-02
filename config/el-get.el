(use-package el-get
  :commands (el-get
             el-get-install
             el-get-update
             el-get-self-update
             el-get-cd
             el-get-describe
             el-get-find-recipe-file
             el-get-elpa-build-local-recipes
             el-get-emacswiki-build-local-recipes
             el-get-list-packages)

  :init
  (progn
    ;; Setup el-get-dir
    (setq el-get-dir (expand-file-name "packages/" config-directory))

    ;; Disable autoloads
    (setq el-get-generate-autoloads nil))

  :config
  (progn
    ;; Set up el-get local recipes path
    (add-to-list 'el-get-recipe-path (expand-file-name "recipes/" config-directory))

    (defun el-get-read-status-file-force ()
      "Reimplementation that generates the same structure as `el-get-status-file' from the installed packages."
      (let* ((files (reverse (directory-files packages-directory t)))
             (is-directory (lambda (file) (and (file-directory-p file) (not (member file '("." ".."))))))
             (directories (remove-if-not is-directory files))
             (packages (mapcar 'file-name-base directories))
             (packages (mapcar 'intern packages)))
        (mapcar (lambda (package) `(,package status "installed")) packages)))))
