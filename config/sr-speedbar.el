(use-package sr-speedbar
  :ensure t
  :defer t
  :custom
  ;; Show tree on the left side
  (sr-speedbar-right-side nil)
  ;; Show all files
  (speedbar-show-unknown-files t)
  ;; Bigger size (default is 24)
  (sr-speedbar-width 35))
