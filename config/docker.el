(use-package docker-tramp
  :ensure t
  :defer t
  :init
  (setq docker-tramp-use-names t))

(use-package docker
  :ensure t
  :defer t)
