(use-package ediff
  :straight nil
  :custom
  ;; Split window horizontally by default
  (ediff-split-window-function 'split-window-horizontally)
  ;; Don't popup a new frame when ediffing
  (ediff-window-setup-function 'ediff-setup-windows-plain))
