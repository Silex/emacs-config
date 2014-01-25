(use-package surround
  :commands global-surround-mode)

(use-package evil-numbers
  :commands (evil-numbers/inc-at-pt
             evil-number/dec-at-pt))

(use-package evil-leader
  :commands global-evil-leader-mode)

(use-package evil
  :commands evil-mode

  :init
  (progn
    ;; White cursor
    (setq evil-default-cursor '(t "white"))

    ;; Magic regexp
    (setq evil-magic 'very-magic))

  :config
  (progn
    (use-package evil-visualstar)

    ;; List of modes where evil should not be enabled
    (dolist (mode '(grep-mode dired-mode git-rebase-mode process-menu-mode))
      (add-to-list 'evil-emacs-state-modes mode))
    ))

(evil-mode)
(global-surround-mode)
(global-evil-leader-mode)
