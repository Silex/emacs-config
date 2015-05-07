(use-package guide-key
  :init
  (setq guide-key/guide-key-sequence '("C-x r"))
  (setq guide-key/idle-delay 0.2)
  (setq guide-key/popup-window-position 'bottom)
  :config
  (guide-key-mode 1))
