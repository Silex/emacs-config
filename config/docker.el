(use-package docker-tramp
  :ensure t
  :defer t
  :custom
  (docker-tramp-use-names t))

(use-package docker :ensure t :defer t)
(use-package dockerfile-mode :ensure t :defer t)
