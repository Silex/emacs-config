;; Use the GDB visual debugging mode
(setq gdb-many-windows t)

;; Treat .h files as C++ files (instead of C)
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; Use the indentation style of "The C++ Programming Language"
(setq c-default-style "stroustrup")
