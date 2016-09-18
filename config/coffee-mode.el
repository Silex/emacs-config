(use-package coffee-mode
  :ensure t
  :mode ("\\.coffee\\'" . coffee-mode)
  :init
  (setq coffee-cleanup-whitespace nil))
