(use-package backup-each-save
  :ensure t
  :defer t
  :init (add-hook 'after-save-hook 'backup-each-save))
