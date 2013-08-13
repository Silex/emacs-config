(setq evil-default-cursor '(t "white"))
(setq evil-magic 'very-magic)

(evil-mode)
(global-evil-leader-mode)

;(defun my-move-key (keymap-from keymap-to key)
;     "Moves key binding from one keymap to another, deleting from the old location. "
;     (define-key keymap-to key (lookup-key keymap-from key))
;     (define-key keymap-from key nil)
;     )
;   (my-move-key evil-motion-state-map evil-normal-state-map (kbd "RET"))
;   (my-move-key evil-motion-state-map evil-normal-state-map " ")
