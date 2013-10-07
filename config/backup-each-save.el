(use-package backup-each-save
  :commands backup-each-save
  :init (add-hook 'after-save-hook 'backup-each-save))
