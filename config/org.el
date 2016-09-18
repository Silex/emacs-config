(use-package org
  :ensure t
  :mode ("\\.org\\'" . org-mode)
  :init
  ;;(setq org-log-done t)
  ;;(setq org-todo-keywords '((sequence "TODO" "PLANNED" "|" "DONE")))
  (setq org-completion-use-ido t)
  (setq org-confirm-babel-evaluate nil)
  (setq org-src-fontify-natively t)
  (setq org-startup-folded nil)
  (setq org-src-tab-acts-natively t)
  :config
  ;; Customize faces
  (custom-set-faces
   '(org-level-3 ((t (:inherit (outline-4)))))
   '(org-level-4 ((t (:inherit (outline-5)))))
   '(org-level-5 ((t (:inherit (outline-6)))))
   '(org-level-6 ((t (:inherit (outline-7)))))
   '(org-level-7 ((t (:inherit (outline-8)))))
   '(org-level-8 ((t (:inherit (outline-3))))))

  ;; Enable many languages by default
  (let ((languages '(emacs-lisp sh ruby python R gnuplot))
        (helper (lambda (token) `(,token . t))))
    (org-babel-do-load-languages 'org-babel-load-languages (mapcar helper languages))))

(use-package org-impress-js
  :defer t)
