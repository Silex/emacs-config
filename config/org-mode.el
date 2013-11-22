(use-package org
  :mode ("\\.org\\'" . org-mode)
  :init
  (progn
    ;;(setq org-log-done t)
    ;;(setq org-todo-keywords '((sequence "TODO" "PLANNED" "|" "DONE")))
    (setq org-completion-use-ido t)
    (setq org-confirm-babel-evaluate nil)
    (setq org-src-fontify-natively t)
    (setq org-startup-folded nil)
    (setq org-src-tab-acts-natively t))
  :config
    ;; Enable many languages by default
    (let ((languages '(emacs-lisp sh ruby python R gnuplot))
          (helper (lambda (token) `(,token . t))))
      (org-babel-do-load-languages 'org-babel-load-languages (mapcar helper languages))))

(use-package org-impress-js
  :commands (org-export-as-impress-js
             org-export-as-impress-js-and-open))
