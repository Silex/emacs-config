(use-package phi-search
  :bind (("C-f" . phi-search)
         ("C-S-f" . phi-search-backward))
  :init
  (setq phi-search-case-sensitive t)
  :config
  (define-key phi-search-default-map (kbd "C-s") nil)
  (setq phi-search-additional-keybinds (--reject (equal (car it) '(kbd "C-f")) phi-search-additional-keybinds)))
