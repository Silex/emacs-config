;; Language modes and tooling

(use-package arc-mode
  :mode ("\\.u?deb\\'" . archive-mode))

(use-package cmake-mode
  :mode (("\\.cmake\\'" . cmake-mode)
         ("CMakeLists.txt" . cmake-mode)))

(use-package coffee-mode
  :mode ("\\.coffee\\'" . coffee-mode)
  :custom
  (coffee-cleanup-whitespace nil))

(use-package conf-mode
  :mode (("\\.ht\\(access\\|passwd\\)\\'" . conf-mode)
         ("\\.seed\\'" . conf-mode)))

(use-package dockerfile-mode)

(use-package cc-mode
  :straight nil
  :mode ("\\.h\\'" . c++-mode)

  :init
  (c-add-style "silex" '("bsd"
                         (c-basic-offset . 2)
                         (c-comment-only-line-offset . 0)
                         (c-offsets-alist . ((statement-block-intro . +)
                                             (substatement-open . 0)
                                             (substatement-label . 0)
                                             (label . 0)
                                             (statement-cont . +)))))
  :custom
  ;; Use the GDB visual debugging mode
  (gdb-many-windows t)

  ;; Use the indentation style of "The C++ Programming Language"
  (c-default-style "silex")
  :config
  (define-key c-mode-map (kbd "C-d") nil)
  (define-key c++-mode-map (kbd "C-d") nil))

(use-package qt-pro-mode
  :mode ("\\.pro\\'" "\\.pri\\'"))

(use-package go-mode)

(use-package haml-mode
  :mode ("\\.hamlc?\\'" . haml-mode))

(use-package ini-mode)

(use-package nginx-mode)

(use-package nix-mode
  :mode "\\.nix\\'")

(use-package nsis-mode)

(use-package js2-mode
  :mode ("\\.js\\'" . js2-mode))

(defun js2-add-semi-colons ()
  "Add missing semi-colons."
  (interactive)
  (--each (--select (string-equal (caar it) "msg.missing.semi") (js2-warnings))
    (let ((pos (nth 1 it))
          (length (nth 2 it)))
      (goto-char (+ pos length))
      (insert ";"))))

(use-package json-mode
  :mode ("\\.json\\'" . json-mode))

(use-package less-css-mode
  :mode ("\\.less\\'" . less-css-mode))

(use-package css-eldoc)

(use-package lisp-mode
  :straight nil
  :mode (("/Cask\\'" . emacs-lisp-mode))
  :custom
  (edebug-trace nil)
  :init
  (add-hook 'emacs-lisp-mode-hook 'eldoc-mode)
  (add-hook 'emacs-lisp-mode-hook (lambda () (add-hook 'after-save-hook 'check-parens nil t))))

(use-package elisp-depmap)

(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  (setq lsp-pwsh-exe (executable-find "powershell.exe"))
  :commands lsp)

(use-package markdown-mode
  :init (custom-set-faces '(markdown-code-face ((t (:background "#2f3029")))))
  :mode (("\\.md\\'" . gfm-mode)
         ("\\.markdown\\'" . markdown-mode)))

(use-package org
  :custom
  (org-confirm-babel-evaluate nil)
  (org-src-fontify-natively t)
  (org-startup-folded nil)
  (org-src-tab-acts-natively t)
  :config
  (custom-set-faces
   '(org-level-3 ((t (:inherit (outline-4)))))
   '(org-level-4 ((t (:inherit (outline-5)))))
   '(org-level-5 ((t (:inherit (outline-6)))))
   '(org-level-6 ((t (:inherit (outline-7)))))
   '(org-level-7 ((t (:inherit (outline-8)))))
   '(org-level-8 ((t (:inherit (outline-3)))))))

(use-package php-mode
  :mode ("\\.php\\'" . php-mode)
  :custom
  (php-mode-coding-style nil))

(use-package powershell)

(defun seeing-is-believing ()
  "Replace the current region (or the whole buffer, if none) with the output
of seeing_is_believing."
  (interactive)
  (let ((beg (if (region-active-p) (region-beginning) (point-min)))
        (end (if (region-active-p) (region-end) (point-max))))
    (shell-command-on-region beg end "seeing_is_believing" nil 'replace)))

(use-package ruby-mode
  :straight nil
  :custom
  ;; Don't automatically insert encoding
  (ruby-insert-encoding-magic-comment nil)
  (ruby-use-encoding-map nil))

(use-package enh-ruby-mode
  :mode ("\\(?:\\.rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'" . enh-ruby-mode)
  :custom-face
  (enh-ruby-op-face ((t (:inherit (font-lock-keyword-face)))))
  :init
  (add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode)))

(use-package rubocop)

(use-package rails-log-mode)

(use-package sass-mode
  :mode ("\\.sass\\'" . sass-mode))

(use-package scss-mode)

(use-package sh-script
  :straight nil
  :custom
  (sh-mode-map (make-sparse-keymap)))

(use-package systemd)

(use-package slim-mode)

(use-package textile-mode
  :mode ("\\.textile\\'" . textile-mode))

(use-package vimrc-mode
  :mode ("\\.vim\\(rc\\)?\\'" . vimrc-mode))

(use-package web-mode
  :config
  (setf (cdr (assoc "erb" web-mode-engine-file-regexps))
    "\\.\\(erb\\|rhtml\\|erb\\.html\\|ecr\\|erb\\.deface\\)\\'")
  :mode (("\\.erb\\'" . web-mode)
         ("\\.deface\\'" . web-mode)
         ("\\.php\\'" . web-mode)))

(use-package yaml-mode
  :mode ("\\.ya?ml\\'" . yaml-mode))

(use-package xml-mode
  :straight nil
  :mode ("\\.csproj\\'" . xml-mode))
