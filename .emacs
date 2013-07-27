(require 'cl)

;; Initialize variables
(setq config-directory (file-name-directory (file-truename (or (buffer-file-name) load-file-name))))
(setq el-get-dir (expand-file-name "packages/" config-directory))

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
(add-to-list 'el-get-recipe-path (concat config-directory "recipes"))

;; Apply visual effects as early as possible
(require 'visual)

;; Benchmark
(require 'performance)
;(performance/record-require-times)

;; Load config
(require 'config)
(load-config)

;; Display how much time it took to load the config
(message "Init completed in %.2fms" (performance/time-subtract-millis (current-time) before-init-time))
