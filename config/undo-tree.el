(use-package undo-tree
  :ensure t
  :bind (("C-z" . undo-tree-undo)
         ("C-S-z" . undo-tree-redo))
  :init
  (setq undo-tree-mode-lighter "")
  (setq undo-tree-auto-save-history t)
  (setq undo-tree-history-directory-alist `((".*" . ,temporary-file-directory)))
  :config
  (global-undo-tree-mode))
