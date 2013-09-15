(use-package helm
  :disabled t
  :commands helm
  :config
  (progn
    (setq helm-input-idle-delay nil)
    (setq helm-split-window-default-side 'above)))
