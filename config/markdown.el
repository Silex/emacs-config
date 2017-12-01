(use-package markdown-mode
  :ensure t
  :init (custom-set-faces '(markdown-code-face ((t (:background "#2f3029")))))
  :mode (("\\.md\\'" . gfm-mode)
         ("\\.markdown\\'" . markdown-mode)))
