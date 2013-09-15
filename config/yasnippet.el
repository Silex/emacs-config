(use-package yasnippet
  :commands yas-global-mode
  :mode ("\\.yasnippet\\'" . snippet-mode)
  :config
  (add-to-list 'yas-snippet-dirs (concat config-directory "snippets"))
  :idle
  (progn
    (yas-global-mode t)
    (yas-reload-all)))
