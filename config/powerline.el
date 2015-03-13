(use-package powerline
  :defer t
  :init
  (set-face-attribute 'mode-line nil
                      :background "OliveDrab3"
                      :box nil)
  (custom-set-faces
   '(powerline-active1 ((t (:inherit default :background "grey22"))))
   '(powerline-active2 ((t (:inherit default :background "grey42"))))))

(powerline-default-theme)
