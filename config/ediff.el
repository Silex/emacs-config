(use-package ediff
  :commands (ediff
             ediff-buffers
             ediff-files
             ediff-directories)
  :init
  (setq-default ediff-split-window-function 'split-window-horizontally))
