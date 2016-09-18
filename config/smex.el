(use-package smex
  :ensure t
  :bind ("M-x" . smex) ; Old m-x is execute-extended-command
  :init
  (setq smex-save-file "~/.emacs.d/smex-items"))
