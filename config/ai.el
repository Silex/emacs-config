(use-package claude-code
  :straight (:type git :host github :repo "stevemolitor/claude-code.el" :branch "main" :depth 1 :files ("*.el" (:exclude "images/*"))))

(use-package ai-code
  :straight (:host github :repo "tninja/ai-code-interface.el")
  :bind
  ("C-c a" . ai-code-menu)
  :custom
  (ai-code-backends-infra-terminal-backend 'eat)
  (ai-code-backends-infra-use-side-window nil)
  (ai-code-backends-infra-window-side 'bottom)
  (ai-code-backends-infra-idle-delay 2.0)
  (ai-code-notifications-enabled t)
  (ai-code-notifications-show-on-response t)
  :config
  (ai-code-set-backend 'codex))
