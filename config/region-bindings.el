(use-package region-bindings-mode
  :ensure t
  :demand t
  :bind (:map region-bindings-mode-map
              ("C-p" . mc/mark-previous-like-this)
              ("C-n" . mc/mark-next-like-this)
              ("C-a" . mc/mark-all-like-this)
              ("C-e" . mc/edit-lines))
  :config
  (region-bindings-mode-enable))
