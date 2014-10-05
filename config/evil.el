(use-package evil
  :defer t

  :init
  ;; White cursor
  (setq evil-default-cursor '(t "white"))
  ;; Magic regexp
  (setq evil-magic 'very-magic)

  :config
  (use-package evil-visualstar)

  ;; List of modes where evil should not be enabled
  (dolist (mode '(grep-mode dired-mode git-rebase-mode process-menu-mode))
    (add-to-list 'evil-emacs-state-modes mode)))

;; (evil-mode)
;; (global-evil-surround-mode)
;; (global-evil-leader-mode)
