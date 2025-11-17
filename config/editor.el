;; Editing behaviour and helpers

(use-package backup-each-save
  :unless (eq system-type 'windows-nt)
  :init (add-hook 'after-save-hook 'backup-each-save))

(use-package compile
  :custom
  (compilation-scroll-output 't)
  :config
  ;; #14 1.718 main.cpp:54:9: error: ‘qwe’ was not declared in this scope
  (add-to-list 'compilation-error-regexp-alist-alist '(docker "^#[0-9]+ [0-9]\.[0-9]+ \\(.+?\\):\\([0-9]+\\):\\([0-9]+\\).*" 1 2 3))
  (add-to-list 'compilation-error-regexp-alist 'docker))

;; Make it so man pages have focus when I request them
(use-package man
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

(use-package editorconfig
  :demand t
  :straight nil
  :config
  (editorconfig-mode 1))

(use-package eimp
  :init
  (add-hook 'image-mode-hook 'eimp-mode))

(use-package eldoc
  :straight nil
  :custom
  (eldoc-idle-delay 1))

(use-package eros)

(use-package expand-region
  :bind ("C-c e" . er/expand-region))

(use-package help
  :straight nil
  :bind (:map help-map
              ("c"   . describe-char)
              ("C-l" . find-library)
              ("C-f" . find-function)
              ("C-k" . find-function-on-key)
              ("C-v" . find-variable)
              ("C-i" . info-display-manual)))

(use-package move-dup
  :demand t
  :config
  (defun move-dup-on ()
    "Decides whether the function `move-dup-mode' should be called with t."
    (unless (or (minibufferp) (memq major-mode '(org-mode git-rebase-mode)))
      (move-dup-mode 1)))
  (global-move-dup-mode))

(use-package pretty-symbols
  :custom
  (pretty-symbol-categories '(lambda relational)))

(use-package saveplace
  :demand t
  :straight nil
  :custom
  (save-place-forget-unreadable-files nil)
  :config
  (save-place-mode))

(use-package pcre2el
  :disabled t
  :init (pcre-mode))

(use-package visual-regexp
  :bind ("M-%" . vr/replace))

(use-package visual-regexp-steroids
  :demand t
  :after visual-regexp)

(use-package which-key
  :demand t
  :config
  (which-key-mode))

;; Remove trailing whitespace automatically
(use-package whitespace-cleanup-mode
  :demand t
  :config
  (global-whitespace-cleanup-mode))

;; Show trailing whitespace
(add-hook 'prog-mode-hook (lambda () (setq show-trailing-whitespace t)))

(use-package yasnippet
  :demand t
  :mode ("\\.yasnippet\\'" . snippet-mode)
  :config
  (add-to-list 'yas-snippet-dirs (concat config-directory "snippets"))
  (yas-global-mode))

(use-package yasnippet-snippets)

(use-package vlf
  :custom
  (vlf-application 'dont-ask))

(use-package vlf-setup
  :demand t
  :straight nil
  :after dired)

(use-package elmacro)
(use-package emr)
(use-package macrostep)
