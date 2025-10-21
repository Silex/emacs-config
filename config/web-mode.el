(use-package web-mode
  :config
  (setf (cdr (assoc "erb" web-mode-engine-file-regexps))
    "\\.\\(erb\\|rhtml\\|erb\\.html\\|ecr\\|erb\\.deface\\)\\'")
  :mode (("\\.erb\\'" . web-mode)
         ("\\.deface\\'" . web-mode)
         ("\\.php\\'" . web-mode)))
