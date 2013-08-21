(setq auto-mode-alist (cons '("\\.org$" . org-mode) auto-mode-alist))

(setq org-confirm-babel-evaluate nil)

(setq org-src-fontify-natively t)
(setq org-startup-folded nil)
(setq org-src-tab-acts-natively t)

;(setq org-log-done t)

;(setq org-todo-keywords '((sequence "TODO" "PLANNED" "|" "DONE")))

(eval-after-load "org"
  '(let ((languages '(emacs-lisp sh ruby python R gnuplot))
         (helper (lambda (token) `(,token . t))))
     (org-babel-do-load-languages 'org-babel-load-languages (mapcar helper languages))))
