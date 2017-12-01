(use-package ido
  :bind ("C-b" . ido-switch-buffer)
  :custom
  (ido-enable-flex-matching t)
  (ido-create-new-buffer 'always)

  (ido-use-url-at-point nil)
  (ido-use-filename-at-point nil)

  ;; Disable auto searching for files unless called explicitly
  (ido-auto-merge-delay-time 99999)

  ;; Avoid "size too big" errors
  (ido-max-directory-size 300000)

  ;; Always propose old buffers as well
  (ido-use-virtual-buffers nil)

  ;; Don't remember history
  (ido-enable-last-directory-history nil)
  :config
  (ido-mode t)
  (ido-everywhere t))

(use-package flx-ido
  :ensure t
  :custom
  (ido-use-faces nil)
  :config
  (flx-ido-mode))

(use-package ido-grid-mode
  :ensure t
  :custom
  (ido-grid-mode-max-columns 1)
  (ido-grid-mode-min-rows 12)
  (ido-grid-mode-prefix-scrolls t)
  (ido-grid-mode-order nil)
  (ido-grid-mode-scroll-down #'ido-grid-mode-next-row)
  (ido-grid-mode-scroll-up #'ido-grid-mode-previous-row)
  :config
  (ido-grid-mode))

(use-package ido-completing-read+
  :ensure t
  :config
  (ido-ubiquitous-mode))

(use-package dired-aux
  :after ido-ubiquitous
  :config
  (put 'dired-do-rename 'ido 'find-file)
  (put 'dired-do-copy 'ido 'find-file))

(use-package ido-occur :ensure t :defer t)

(use-package idomenu :ensure t :defer t)
