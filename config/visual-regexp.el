(use-package visual-regexp
  :bind ("M-%" . vr/replace))

(use-package visual-regexp-steroids
  :demand t
  :after visual-regexp)
