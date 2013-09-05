;; YASnippet
(yas/global-mode t)
(add-to-list 'yas-snippet-dirs (concat config-directory "snippets"))
(add-to-list 'auto-mode-alist '("\\.yasnippet\\'" . snippet-mode))
(yas-reload-all)
