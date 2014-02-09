(use-package backup-each-save
  :defer t
  :init (add-hook 'after-save-hook 'backup-each-save))
