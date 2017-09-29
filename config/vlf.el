(use-package vlf
  :ensure t
  :after t
  :init
  (setq vlf-application 'dont-ask))

(use-package vlf-setup
  :ensure nil
  :after dired)
