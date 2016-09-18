(use-package weechat
  :ensure t
  :defer t
  :init
  (setq weechat-auto-close-buffer t)
  :config
  (add-hook 'weechat-mode-hook 'enable-word-wrap))
