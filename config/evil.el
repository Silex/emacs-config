(setq evil-default-cursor '(t "white"))
(setq evil-magic 'very-magic)

(add-to-list 'evil-emacs-state-modes 'grep-mode)
(add-to-list 'evil-emacs-state-modes 'dired-mode)

(evil-mode)
(global-evil-leader-mode)
