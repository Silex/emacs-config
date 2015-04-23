(use-package phi-search
  :defer t
  :init
  (setq phi-search-case-sensitive t)
  :config
  (define-key phi-search-default-map (kbd "C-s") nil)
  (setq phi-search-additional-keybinds (--reject (equal (car it) '(kbd "C-f")) phi-search-additional-keybinds)))
