(use-package fic-mode
  :ensure t
  :defer t
  :custom
  (fic-background-color "Orange")
  (fic-foreground-color "Black")
  :config
  (modify-face 'font-lock-fic-face fic-foreground-color fic-background-color nil t nil nil nil nil))
