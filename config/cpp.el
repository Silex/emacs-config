(use-package cc-mode
  :mode ("\\.h\\'" . c++-mode)

  :init
  (c-add-style "silex" '("bsd"
                         (c-basic-offset . 2)
                         (c-comment-only-line-offset . 0)
                         (c-offsets-alist . ((statement-block-intro . +)
                                             (substatement-open . 0)
                                             (substatement-label . 0)
                                             (label . 0)
                                             (statement-cont . +)))))
  ;; Use the GDB visual debugging mode
  (setq gdb-many-windows t)

  ;; Use the indentation style of "The C++ Programming Language"
  (setq c-default-style "silex")
  :config
  (define-key c++-mode-map (kbd "C-d") nil)
  (define-key c++-mode-map (kbd "C-c c") 'compile))

(use-package rtags
  :ensure t
  :commands rtags-find-symbol-at-point)

(use-package irony
  :ensure t
  :defer t)
