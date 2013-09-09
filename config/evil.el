(setq evil-default-cursor '(t "white"))
(setq evil-magic 'very-magic)

;; List of modes where evil should not be enabled
(nconc evil-emacs-state-modes '(grep-mode dired-mode git-rebase-mode))

(evil-mode)
(global-evil-leader-mode)
