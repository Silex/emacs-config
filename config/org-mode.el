(setq org-confirm-babel-evaluate nil)

(setq org-src-fontify-natively t)
(setq org-startup-folded nil)
(setq org-src-tab-acts-natively t)

;(setq org-log-done t)

;(setq org-todo-keywords '((sequence "TODO" "PLANNED" "|" "DONE")))

(eval-after-load "org"
  '(progn
     (org-babel-do-load-languages 'org-babel-load-languages '((emacs-lisp . t)
                                                              (sh . t)
                                                              (ruby . t)
                                                              (python . t)
                                                              (R . t)
                                                              (gnuplot . t)))
     ))
