(use-package sunshine
  :ensure t
  :defer t
  :custom
  (sunshine-location "Geneva, Switzerland")
  (sunshine-show-icons t)
  (sunshine-units 'metric))

(defalias 'weather-display 'sunshine-forecast)
