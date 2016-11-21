(use-package yasnippet
  :ensure t
  :mode ("\\.yasnippet\\'" . snippet-mode)
  :demand t
  :config
  (add-to-list 'yas-snippet-dirs (concat config-directory "snippets"))
  (yas-global-mode))
