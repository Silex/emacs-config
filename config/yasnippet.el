(use-package yasnippet
  :demand t
  :mode ("\\.yasnippet\\'" . snippet-mode)
  :config
  (add-to-list 'yas-snippet-dirs (concat config-directory "snippets"))
  (yas-global-mode))
