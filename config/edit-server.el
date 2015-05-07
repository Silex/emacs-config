(defun emacs-chrome-start()
  (edit-server-start))

(use-package edit-server
  :defer 2
  :init
  (setq edit-server-url-major-mode-alist '(("github\\.com" . markdown-mode)))
  :config
  (edit-server-start))
