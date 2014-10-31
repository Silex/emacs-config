(use-package lisp-mode
  :mode (("\\.?emacs\\'" . emacs-lisp-mode)
         ("Cask\\'" . emacs-lisp-mode))
  :init
  (setq edebug-trace t)
  (add-hook 'emacs-lisp-mode-hook 'eldoc-mode)
  (add-hook 'emacs-lisp-mode-hook 'indent-guide-mode)
  (add-hook 'emacs-lisp-mode-hook (lambda () (add-hook 'after-save-hook 'check-parens nil t))))

;; Taken from https://github.com/magnars/.emacs.d/blob/master/defuns/lisp-defuns.el
(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))