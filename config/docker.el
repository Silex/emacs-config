(use-package docker-tramp
  :custom
  (docker-tramp-use-names t))

(use-package docker
  :custom
  (docker-run-async-with-buffer-function 'docker-run-async-with-buffer-vterm)
  :bind ("C-c d" . docker))

(use-package dockerfile-mode)
