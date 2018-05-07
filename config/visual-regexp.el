(use-package visual-regexp
  :ensure t
  :bind ("M-%" . vr/replace))

(use-package visual-regexp-steroids
  :ensure t
  :after visual-regexp)
