(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  (setq lsp-pwsh-exe (executable-find "powershell.exe"))
  :commands lsp)
