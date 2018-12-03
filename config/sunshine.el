(use-package sunshine
  :custom
  (sunshine-location "Geneva, Switzerland")
  (sunshine-show-icons t)
  (sunshine-units 'metric))

(defalias 'weather-display 'sunshine-forecast)
