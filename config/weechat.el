(use-package weechat
  :custom
  (weechat-auto-close-buffer t)
  :config
  (add-hook 'weechat-mode-hook 'enable-word-wrap))
