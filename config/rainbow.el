(use-package rainbow-mode
  :defer t
  :init
  (setq rainbow-html-colors-major-mode-list '(css-mode
                                              html-mode
                                              less-css-mode
                                              nxml-mode
                                              php-mode
                                              sass-mode
                                              scss-mode
                                              web-mode))
                                              xml-mode
  (dolist (mode rainbow-html-colors-major-mode-list)
    (add-hook (intern (format "%s-hook" mode)) 'rainbow-mode)))
