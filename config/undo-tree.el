(use-package undo-tree
  :ensure t
  :bind (("C-z" . undo-tree-undo)
         ("C-S-z" . undo-tree-redo))
  :custom
  (undo-tree-mode-lighter "")
  (undo-tree-auto-save-history t)
  (undo-tree-history-directory-alist `((".*" . ,temporary-file-directory)))
  :config
  (global-undo-tree-mode))
