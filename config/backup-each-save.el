(use-package backup-each-save
  :unless (eq system-type 'windows-nt)
  :init (add-hook 'after-save-hook 'backup-each-save))
