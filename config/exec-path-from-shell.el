(use-package exec-path-from-shell
  :commands exec-path-from-shell-initialize
  :idle
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

