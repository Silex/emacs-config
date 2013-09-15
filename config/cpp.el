(use-package c++-mode
  :mode ("\\.h\\'" . c++-mode)

  :init
  (progn
    ;; Use the GDB visual debugging mode
    (setq gdb-many-windows t)

    ;; Use the indentation style of "The C++ Programming Language"
    (setq c-default-style "stroustrup")))
