(use-package evil-leader :ensure t :defer t)
(use-package evil-numbers :ensure t :defer t)
(use-package evil-surround :ensure t :defer t)
(use-package evil-visualstar :ensure t :defer t)
(use-package evil-mc :ensure t :defer t)
(use-package evil-mc-extras :ensure t :defer t)

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
  (require 'evil-leader)
  (require 'evil-numbers)
  (require 'evil-surround)
  (require 'evil-visualstar)
  (require 'evil-mc)
  (require 'evil-mc-extras)

  ;; List of modes where evil should not be enabled
  (dolist (mode '(grep-mode dired-mode git-rebase-mode process-menu-mode))
    (add-to-list 'evil-emacs-state-modes mode)))
