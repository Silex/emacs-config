(use-package docker-tramp
  :custom
  (docker-tramp-use-names t))

(use-package docker
  :bind ("C-c d" . docker))

(use-package dockerfile-mode)
