(use-package edit-server
  :ensure nil
  :custom
  (edit-server-url-major-mode-alist '(("github\\.com" . gfm-mode)))
  :config
  (edit-server-start))
