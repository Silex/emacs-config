;; Make it so man pages have focus when I request them
(use-package man
  :defer t
  :custom
  (Man-notify-method 'aggressive))

;; Make it so help windows have focus by default
(mapc (lambda (function)
        (ad-add-advice function
                       '(focus nil t (advice . (lambda () ad-do-it (other-window 1))))
                       'around
                       0)
        (ad-activate function))
      '(apropos command-apropos view-lossage
        describe-file describe-bindings describe-mode describe-syntax
        describe-function describe-variable describe-key))
