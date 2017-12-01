(use-package weechat
  :ensure t
  :defer t
  :custom
  (weechat-auto-close-buffer t)
  :config
  (add-hook 'weechat-mode-hook 'enable-word-wrap))
