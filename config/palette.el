(use-package palette
  :ensure t
  :defer t
  :custom
  (palette-hex-rgb-digits 2)
  :config
  (define-key palette-mode-map (kbd "<mouse-1>") 'palette-pick-background-at-mouse)
  (define-key palette-mode-map (kbd "<mouse-2>") 'palette-background-at-mouse))
