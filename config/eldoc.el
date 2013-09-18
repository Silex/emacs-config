(use-package php-eldoc
  :commands php-eldoc-function
  :init
  (progn
    (add-hook 'php+-mode-hook
              '(lambda ()
                 (set
                  (make-local-variable 'eldoc-documentation-function)
                  'php-eldoc-function)
                 (eldoc-mode)))

    (add-hook 'php-mode-hook
              '(lambda ()
                 (set
                  (make-local-variable 'eldoc-documentation-function)
                  'php-eldoc-function)
                 (eldoc-mode)))))

(use-package css-eldoc
  :commands turn-on-css-eldoc)

(use-package c-eldoc
  :commands c-turn-on-eldoc-mode)
