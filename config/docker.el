(use-package docker-tramp
  :ensure t
  :defer t
  :custom
  (docker-tramp-use-names t))

(use-package docker
  :ensure t
  :bind ("C-c d" . docker))

(use-package dockerfile-mode :ensure t :defer t)
