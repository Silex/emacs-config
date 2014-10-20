(defun emacs-chrome-start()
  (edit-server-start))

(use-package edit-server
  :defer t
  :init (setq edit-server-url-major-mode-alist '(("github\\.com" . markdown-mode)))
  :idle (edit-server-start))
