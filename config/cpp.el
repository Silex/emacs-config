(use-package cc-mode
  :mode ("\\.h\\'" . c++-mode)

  :init
  (progn
    ;; Use the GDB visual debugging mode
    (setq gdb-many-windows t)

    ;; Use the indentation style of "The C++ Programming Language"
    (setq c-default-style "stroustrup")))

;;; Turn Semantic on
;(semantic-mode 1)
;
;;; Try to make completions when not typing
;(global-semantic-idle-completions-mode 1)
;
;;; Use the Semantic speedbar additions
;(add-hook 'speedbar-load-hook (lambda () (require 'semantic/sb))))
