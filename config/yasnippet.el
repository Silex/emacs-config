(use-package yasnippet
  :mode ("\\.yasnippet\\'" . snippet-mode)
  :config
  (add-to-list 'yas-snippet-dirs (concat config-directory "snippets"))
  :idle
  (yas-global-mode t)
  (yas-reload-all))
