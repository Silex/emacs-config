(use-package rainbow-mode
  :custom
  (rainbow-html-colors-major-mode-list '(css-mode
                                         html-mode
                                         less-css-mode
                                         nxml-mode
                                         php-mode
                                         sass-mode
                                         scss-mode
                                         web-mode
                                         xml-mode))
  :init
  (dolist (mode rainbow-html-colors-major-mode-list)
    (add-hook (intern (format "%s-hook" mode)) 'rainbow-mode)))
