(require 'cl)

;; Initialize variables
(setq config-directory (file-name-directory (file-truename (or (buffer-file-name) load-file-name))))
(setq packages-directory (expand-file-name "packages/" config-directory))

;; Setup load-path
(add-to-list 'load-path config-directory)

;; Add all packages to load-path
(dolist (dir (reverse (directory-files packages-directory)))
  (unless (member dir '("." ".."))
    (add-to-list 'load-path (expand-file-name dir packages-directory))))

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
