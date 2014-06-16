;; Remove trailing whitespace automatically
(setq highlight-changes-invisible-string nil)
(ws-butler-global-mode)

;; Show trailing whitespace
(add-hook 'prog-mode-hook (lambda () (setq show-trailing-whitespace t)))
