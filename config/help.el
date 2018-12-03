(use-package help
  :ensure nil
  :bind (:map help-map
              ("c"   . describe-char)
              ("C-l" . find-library)
              ("C-f" . find-function)
              ("C-k" . find-function-on-key)
              ("C-v" . find-variable)
              ("C-i" . info-display-manual)))
