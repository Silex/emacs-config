(use-package scss-mode
  :ensure t
  :mode ("\\.scss\\'" . scss-mode)
  :init
    (setq scss-compile-at-save nil))
