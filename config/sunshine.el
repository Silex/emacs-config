(use-package sunshine
  :ensure t
  :defer t
  :init
  (setq sunshine-location "Geneva, Switzerland")
  (setq sunshine-show-icons t)
  (setq sunshine-units 'metric))

(defalias 'weather-display 'sunshine-forecast)
