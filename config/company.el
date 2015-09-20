(use-package company
  :init
  (setq company-minimum-prefix-length 2)
  :config
  (add-to-list 'company-backends 'company-emoji)
  (global-company-mode))

;;(set-face-attribute 'company-tooltip-selection nil
;;                    :background "#336655")
;;
;;(set-face-attribute 'company-tooltip nil
;;                    :foreground "#dfdfe1"
;;                    :background "#393939")
;;(set-face-attribute 'company-tooltip-common nil
;;                    :foreground "#ffcccc")
;;
;;(set-face-attribute 'company-tooltip-common-selection nil
;;                    :foreground "LightSkyBlue")
;;
;;(set-face-attribute 'company-scrollbar-bg nil
;;                    :background (face-foreground 'company-tooltip))
;;
;;(set-face-attribute 'company-scrollbar-fg nil
;;                    :background (face-background 'company-tooltip))

;;(custom-set-faces
;; '(company-echo ((t (nil))))
;; '(company-echo-common ((t (:foreground "cyan"))))
;; '(company-preview ((t (:background "gray30" :foreground "wheat"))))
;; '(company-preview-common ((t (:background "gray30" :foreground "cyan"))))
;; '(company-tooltip ((t (:background "white" :foreground "black"))))
;; '(company-tooltip-common ((t (:background "white" :foreground "red"))))
;; '(company-tooltip-common-selection ((t (:background "gray80" :foreground "red"))))
;; '(company-tooltip-selection ((t (:background "gray80" :foreground "black")))))

;; (require 'color)
;; (let ((bg (face-attribute 'default :background)))
;;   (custom-set-faces
;;    `(company-tooltip ((t (:inherit default :background ,(color-lighten-name bg 2)))))
;;    `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 10)))))
;;    `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 5)))))
;;    `(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
;;    `(company-tooltip-common ((t (:inherit font-lock-constant-face))))))
