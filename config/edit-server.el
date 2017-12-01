(use-package edit-server
  :defer t
  :custom
  (edit-server-url-major-mode-alist '(("github\\.com" . gfm-mode)))
  :config
  (edit-server-start))
