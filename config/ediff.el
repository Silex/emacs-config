(use-package ediff
  :defer t
  :init
  (progn
    ;; Split window horizontally by default
    (setq-default ediff-split-window-function 'split-window-horizontally)
    ;; Don't popup a new frame when ediffing
    (setq-default ediff-window-setup-function 'ediff-setup-windows-plain)))
