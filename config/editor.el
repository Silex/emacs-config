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

(use-package hippie-exp
  :custom
  (hippie-expand-try-functions-list
   '(try-expand-dabbrev
     try-expand-dabbrev-all-buffers
     try-expand-dabbrev-from-kill
     try-complete-file-name-partially
     try-complete-file-name
     try-complete-lisp-symbol-partially
     try-complete-lisp-symbol
     try-expand-whole-kill)))

(use-package miniedit
  :init (miniedit-install))

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

(use-package smartparens
  :config
  (require 'smartparens-config)
  (define-key smartparens-mode-map (kbd "C-M-f") 'sp-forward-sexp)
  (define-key smartparens-mode-map (kbd "C-M-b") 'sp-backward-sexp)

  (define-key smartparens-mode-map (kbd "C-M-d") 'sp-down-sexp)
  (define-key smartparens-mode-map (kbd "C-M-a") 'sp-backward-down-sexp)
  (define-key smartparens-mode-map (kbd "C-S-a") 'sp-beginning-of-sexp)
  (define-key smartparens-mode-map (kbd "C-S-d") 'sp-end-of-sexp)

  (define-key smartparens-mode-map (kbd "C-M-e") 'sp-up-sexp)
  ;;(define-key emacs-lisp-mode-map (kbd ")") 'sp-up-sexp)
  (define-key smartparens-mode-map (kbd "C-M-u") 'sp-backward-up-sexp)
  (define-key smartparens-mode-map (kbd "C-M-t") 'sp-transpose-sexp)

  (define-key smartparens-mode-map (kbd "C-M-n") 'sp-next-sexp)
  (define-key smartparens-mode-map (kbd "C-M-p") 'sp-previous-sexp)

  (define-key smartparens-mode-map (kbd "C-M-k") 'sp-kill-sexp)
  (define-key smartparens-mode-map (kbd "C-M-w") 'sp-copy-sexp)

  (define-key smartparens-mode-map (kbd "M-<delete>") 'sp-unwrap-sexp)
  (define-key smartparens-mode-map (kbd "M-<backspace>") 'sp-backward-unwrap-sexp)

  (define-key smartparens-mode-map (kbd "C-(") 'sp-forward-slurp-sexp)
  (define-key smartparens-mode-map (kbd "C-)") 'sp-forward-barf-sexp)
  (define-key smartparens-mode-map (kbd "C-{") 'sp-backward-slurp-sexp)
  (define-key smartparens-mode-map (kbd "C-}") 'sp-backward-barf-sexp)

  ;; (define-key smartparens-mode-map (kbd "M-D") 'sp-splice-sexp)
  ;; (define-key smartparens-mode-map (kbd "C-M-<delete>") 'sp-splice-sexp-killing-forward)
  ;; (define-key smartparens-mode-map (kbd "C-M-<backspace>") 'sp-splice-sexp-killing-backward)
  ;; (define-key smartparens-mode-map (kbd "C-S-<backspace>") 'sp-splice-sexp-killing-around)

  ;; (define-key smartparens-mode-map (kbd "C-]") 'sp-select-next-thing-exchange)
  ;; (define-key smartparens-mode-map (kbd "C-<left_bracket>") 'sp-select-previous-thing)
  ;; (define-key smartparens-mode-map (kbd "C-M-]") 'sp-select-next-thing)

  (define-key smartparens-mode-map (kbd "M-F") 'sp-forward-symbol)
  (define-key smartparens-mode-map (kbd "M-B") 'sp-backward-symbol)

  ;; (define-key smartparens-mode-map (kbd "H-t") 'sp-prefix-tag-object)
  ;; (define-key smartparens-mode-map (kbd "H-p") 'sp-prefix-pair-object)
  ;; (define-key smartparens-mode-map (kbd "H-s c") 'sp-convolute-sexp)
  ;; (define-key smartparens-mode-map (kbd "H-s a") 'sp-absorb-sexp)
  ;; (define-key smartparens-mode-map (kbd "H-s e") 'sp-emit-sexp)
  ;; (define-key smartparens-mode-map (kbd "H-s p") 'sp-add-to-previous-sexp)
  ;; (define-key smartparens-mode-map (kbd "H-s n") 'sp-add-to-next-sexp)
  ;; (define-key smartparens-mode-map (kbd "H-s j") 'sp-join-sexp)
  ;; (define-key smartparens-mode-map (kbd "H-s s") 'sp-split-sexp)

  ;; html-mode
  (sp-with-modes '(html-mode sgml-mode)
    (sp-local-pair "<" ">"))
  (smartparens-global-mode t)
  (show-smartparens-global-mode))

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

(use-package aggressive-indent)
(use-package elmacro)
(use-package emr)
(use-package macrostep)
