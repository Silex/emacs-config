(use-package move-dup
  :config
  (define-global-minor-mode silex/global-move-dup-mode move-dup-mode
    (lambda ()
      (when (not (memq major-mode '(org-mode git-rebase-mode)))
        (move-dup-mode))))
  (silex/global-move-dup-mode))
