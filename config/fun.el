;; Fun, relaxing, and non-essential extras

;; M-x snake
;; M-x tetris
;; M-x zone
;; M-x doctor
;; M-x butterfly
;; M-x yow
;; M-x phases-of-moon
;; M-x animate-birthday-present

(use-package sunshine
  :custom
  (sunshine-location "Geneva, Switzerland")
  (sunshine-show-icons t)
  (sunshine-units 'metric))

(defalias 'weather-display 'sunshine-forecast)

(use-package fireplace)

(use-package chess)

(use-package lichess
  :straight (:host github :repo "tmythicator/lichess.el"))

;; Screensaver
(use-package zone)

(use-package litable)
