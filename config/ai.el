(use-package eat)

(use-package claude-code
  :straight (:type git :host github :repo "stevemolitor/claude-code.el" :branch "main" :depth 1 :files ("*.el" (:exclude "images/*")))
  :custom
  (claude-code-terminal-backend 'vterm))

(use-package ai-code-interface
  :straight (:host github :repo "tninja/ai-code-interface.el")
  :init
  (global-set-key (kbd "C-c a") #'ai-code-menu)
  :config
  (ai-code-set-backend 'codex))
