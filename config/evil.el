(use-package evil
  :ensure t
  :custom
  (evil-want-keybinding nil)
  (evil-want-C-d-scroll nil)
  (evil-want-C-i-scroll nil)
  (evil-want-Y-yank-to-eol t)
  (evil-default-cursor '(t "white"))
  (evil-magic 'very-magic)
  (evil-shift-width 2)
  (evil-want-fine-undo t)
  :config
  (evil-mode)
  (setq evil-emacs-state-modes (append evil-emacs-state-modes '(docker-container-mode docker-image-mode docker-volume-mode docker-network-mode docker-machine-mode))))

(use-package evil-collection
  :ensure t
  :after evil
  :config
  (evil-collection-init))

(use-package evil-surround
  :ensure t
  :after evil
  :config
  (global-evil-surround-mode 1)
  (evil-define-key 'visual evil-surround-mode-map "s" 'evil-surround-region)
  (evil-define-key 'visual evil-surround-mode-map "S" 'evil-Surround-region))

(use-package evil-numbers
  :ensure t
  :after evil
  :bind (("C-c +" . evil-numbers/inc-at-pt)
         ("C-c -" . evil-numbers/dec-at-pt)))

(use-package evil-mc
  :ensure t
  :after evil
  :config
  (global-evil-mc-mode))

(use-package evil-magit
  :ensure t
  :after evil)

(use-package evil-matchit
  :ensure t
  :after evil
  :config
  (global-evil-matchit-mode 1))

(use-package evil-visualstar
  :ensure t
  :after evil
  :config
  (global-evil-visualstar-mode))
