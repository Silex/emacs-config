;; Wait one second before giving help
(setq eldoc-idle-delay 1)

(use-package php-eldoc
  :commands php-eldoc-function
  :init
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
               (eldoc-mode))))
