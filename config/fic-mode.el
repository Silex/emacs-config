(use-package fic-mode
  :defer t
  :init
  (progn
    (setq fic-background-color "Orange")
    (setq fic-foreground-color "Black")
    (modify-face 'font-lock-fic-face fic-foreground-color
                 fic-background-color nil t nil nil nil nil)))
