(use-package exec-path-from-shell
  :commands exec-path-from-shell-initialize)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
