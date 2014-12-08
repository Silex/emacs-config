;; Helper for recentf
(defun recentf-ido-find-file ()
  "Find a recent file using Ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))

(use-package ido
  :defer t
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
  (setq ido-use-virtual-buffers nil))

(use-package flx-ido
  :defer t
  :init
  (setq ido-use-faces nil))

(use-package kill-ring-ido
  :commands kill-ring-ido)

(use-package ido-vertical-mode
  :defer t
  :init
  (setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right))

(use-package ido-ubiquitous
  :defer t
  :config
  (add-to-list 'ido-ubiquitous-function-overrides '(enable exact "find-tag-interactive"))
  (add-to-list 'ido-ubiquitous-command-overrides '(enable exact "man")))

(ido-mode t)
(ido-everywhere t)
(ido-ubiquitous-mode)
(ido-vertical-mode)
(flx-ido-mode)
