(use-package lisp-mode
  :straight nil
  :mode (("/Cask\\'" . emacs-lisp-mode))
  :custom
  (edebug-trace nil)
  :init
  (add-hook 'emacs-lisp-mode-hook 'eldoc-mode)
  (add-hook 'emacs-lisp-mode-hook 'indent-guide-mode)
  (add-hook 'emacs-lisp-mode-hook (lambda () (add-hook 'after-save-hook 'check-parens nil t))))

(use-package elisp-depmap)
