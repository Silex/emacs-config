(use-package move-dup
  :ensure t
  :config
  (defun move-dup-on ()
    "Decides whether the function `move-dup-mode' should be called with t."
    (unless (or (minibufferp) (memq major-mode '(org-mode git-rebase-mode)))
      (move-dup-mode 1)))
  (global-move-dup-mode))
