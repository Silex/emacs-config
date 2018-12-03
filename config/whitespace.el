;; Remove trailing whitespace automatically
(use-package whitespace-cleanup-mode
  :demand t
  :config
  (global-whitespace-cleanup-mode))

;; Show trailing whitespace
(add-hook 'prog-mode-hook (lambda () (setq show-trailing-whitespace t)))
