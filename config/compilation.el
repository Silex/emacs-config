(use-package compile
  :custom
  (compilation-scroll-output 't)
  :config
  ;; #14 1.718 main.cpp:54:9: error: ‘qwe’ was not declared in this scope
  (add-to-list 'compilation-error-regexp-alist-alist '(docker "^#[0-9]+ [0-9]\.[0-9]+ \\(.+?\\):\\([0-9]+\\):\\([0-9]+\\).*" 1 2 3))
  (add-to-list 'compilation-error-regexp-alist 'docker))
