(use-package hippie-exp
  :ensure t
  :defer t
  :custom
  (hippie-expand-try-functions-list
   '(try-expand-dabbrev
     try-expand-dabbrev-all-buffers
     try-expand-dabbrev-from-kill
     try-complete-file-name-partially
     try-complete-file-name
     try-complete-lisp-symbol-partially
     try-complete-lisp-symbol
     try-expand-whole-kill)))
