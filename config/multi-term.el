(use-package multi-term
  :ensure t
  :defer t
  :init
  (setq multi-term-program-switches "--login")
  (add-hook 'term-mode-hook (lambda()
                              (setq yas-dont-activate t))))
