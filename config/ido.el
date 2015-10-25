;; Helper for recentf
(defun recentf-ido-find-file ()
  "Find a recent file using Ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))

(use-package ido
  :init
  (setq ido-enable-flex-matching t)
  (setq ido-create-new-buffer 'always)

  ;(setq ido-show-dot-for-dired t)
  (setq ido-use-url-at-point nil)
  (setq ido-use-filename-at-point nil)

  ;; Disable auto searching for files unless called explicitly
  (setq ido-auto-merge-delay-time 99999)

  ;; Avoid "size too big" errors
  (setq ido-max-directory-size 300000)

  ;; Always propose old buffers as well
  (setq ido-use-virtual-buffers nil)
  :config
  (ido-mode t)
  (ido-everywhere t))

(use-package flx-ido
  :init
  (setq ido-use-faces nil)
  :config
  (flx-ido-mode))

(use-package ido-grid-mode
  :init
  (setq ido-grid-mode-max-columns 1)
  (setq ido-grid-mode-min-rows 12)
  (setq ido-grid-mode-prefix-scrolls t)
  (setq ido-grid-mode-order nil)
  (setq ido-grid-mode-scroll-down #'ido-grid-mode-next-row)
  (setq ido-grid-mode-scroll-up #'ido-grid-mode-previous-row)
  :config
  (ido-grid-mode))

(use-package ido-ubiquitous
  :config
  (add-to-list 'ido-ubiquitous-function-overrides '(enable exact "find-tag-interactive"))
  (add-to-list 'ido-ubiquitous-command-overrides '(enable exact "man"))
  (ido-ubiquitous-mode))
