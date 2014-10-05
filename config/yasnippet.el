(use-package yasnippet
  :mode ("\\.yasnippet\\'" . snippet-mode)
  :config
  (define-key yas-minor-mode-map (kbd "C-c") nil)
  (add-to-list 'yas-snippet-dirs (concat config-directory "snippets"))
  :idle
  (yas-global-mode t)
  (yas-reload-all))
