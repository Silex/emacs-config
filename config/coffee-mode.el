(use-package coffee-mode
  :commands coffee-mode
  :mode ("\\.coffee\\'" . coffee-mode)
  :init
  (setq coffee-cleanup-whitespace nil
        coffee-tab-width 2))
