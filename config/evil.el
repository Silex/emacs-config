(setq evil-default-cursor '(t "white"))
(setq evil-magic 'very-magic)

;; List of modes where evil should not be enabled
(dolist (mode '(grep-mode dired-mode git-rebase-mode))
  (add-to-list 'evil-emacs-state-modes mode))

(evil-mode)
(global-evil-leader-mode)
