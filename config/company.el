(use-package company
  :defer t
  :init
  (setq company-idle-delay t)
  (setq company-minimum-prefix-length 1)
  :config
  (push 'company-robe company-backends)
  (push 'company-readline company-backends)
  (add-hook 'rlc-no-readline-hook (lambda () (company-mode -1))))
