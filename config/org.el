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
