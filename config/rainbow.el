(use-package rainbow-mode
  :commands rainbow-mode
  :init
  (progn
    (setq rainbow-html-colors-major-mode-list
          '(html-mode css-mode php-mode nxml-mode xml-mode sass-mode scss-mode less-css-mode))
    (dolist (mode rainbow-html-colors-major-mode-list)
      (add-hook (intern (format "%s-hook" mode)) 'rainbow-mode))))
