(use-package evil
  :defer t
  :ensure t
  :init
  ;; White cursor
  (setq evil-default-cursor '(t "white"))
  ;; Magic regexp
  (setq evil-magic 'very-magic)
  ;;(setq evil-mc-cursor-default-face ((t (:inverse-video t :inherit (evil-default-cursor)))))
  :config
  ;; List of modes where evil should not be enabled
  (dolist (mode '(grep-mode dired-mode git-rebase-mode process-menu-mode))
    (add-to-list 'evil-emacs-state-modes mode)))

(use-package evil-leader :ensure t :after evil)
(use-package evil-numbers :ensure t :after evil)
(use-package evil-surround :ensure t :after evil)
(use-package evil-visualstar :ensure t :after evil)
(use-package evil-mc :ensure t :after evil)
(use-package evil-mc-extras :ensure t :after evil)
