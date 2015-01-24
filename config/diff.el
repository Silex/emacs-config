(use-package diff-mode
  :defer t
  :init
  (custom-set-faces
   '(diff-added ((t (:foreground "Green"))) 'now)
   '(diff-removed ((t (:foreground "Red"))) 'now)))
