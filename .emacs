(require 'cl)

(defun buffer-file-directory ()
  "Returns the buffer's file directory"
  (interactive)
  (file-name-directory
    (file-truename
      (or (buffer-file-name)
          load-file-name))))

;; Initialize variables
(setq config-directory (substring (buffer-file-directory) 0 -1))
(setq el-get-dir (concat config-directory "/packages/"))

;; Setup load-path
(add-to-list 'load-path config-directory)
(add-to-list 'load-path (concat el-get-dir "/el-get"))

;; Install el-get if necessary and build elpa recipes
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (el-get 'sync '(package))
  (package-initialize)
  (el-get-elpa-build-local-recipes))

;; Set up el-get local recipes path
(add-to-list 'el-get-recipe-path (concat config-directory "/recipes"))

;; Load config
(require 'config)
(load-config)
