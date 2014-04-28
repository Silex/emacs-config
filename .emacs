(require 'cl)

;; Initialize variables
(setq config-directory (file-name-directory (file-truename (or (buffer-file-name) load-file-name))))
(setq packages-directory (expand-file-name "packages/" config-directory))

;; Setup load-path
(add-to-list 'load-path config-directory)

;; Add all packages to load-path
(dolist (dir (reverse (directory-files packages-directory t)))
  (when (and (file-directory-p dir)
             (not (member dir '("." ".."))))
    (add-to-list 'load-path dir)))

;; Apply visual effects as early as possible
(require 'visual)

;; Benchmark
;(require 'performance)
;(performance/record-require-times)

;; Load config
(require 'config)
(load-config)
