(use-package dumb-jump
  :demand t
  :config
  (dumb-jump-mode)
  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate))
