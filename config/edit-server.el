(use-package edit-server
  :defer t
  :init
  (setq edit-server-url-major-mode-alist '(("github\\.com" . markdown-mode)))
  :config
  (edit-server-start))
