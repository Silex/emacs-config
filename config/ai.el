(use-package claude-code
  :straight (:type git :host github :repo "stevemolitor/claude-code.el" :branch "main" :depth 1 :files ("*.el" (:exclude "images/*")))
  :bind
  ("C-c c" . claude-code-transient)
  :custom
  (claude-code-toggle-auto-select t)
  (claude-code-terminal-backend 'ghostel))

(use-package ai-code
  :straight (:host github :repo "tninja/ai-code-interface.el")
  :bind
  ("C-c a" . ai-code-menu)
  :custom
  (ai-code-backends-infra-terminal-backend 'ghostel)
  (ai-code-backends-infra-use-side-window nil)
  (ai-code-backends-infra-window-side 'bottom)
  (ai-code-backends-infra-idle-delay 2.0)
  (ai-code-notifications-enabled t)
  (ai-code-notifications-show-on-response t)
  (ai-code-mcp-debug-tools-enabled nil)
  (ai-code-mcp-agent-enabled-backends '())
  (ai-code-onboarding-auto-show nil)
  :config
  (ai-code-set-backend 'claude-code)
  (ai-code-prompt-filepath-completion-mode -1))

(defun silex/agent-shell-toggle-project ()
  "Toggle the current project's agent shell without DWIM context capture."
  (interactive)
  (let* ((default-directory (or (projectile-project-root) default-directory))
          (project-shell (seq-first (agent-shell-project-buffers)))
          (shell-buffer
            (or project-shell
              (agent-shell--start
                :config (or (seq-find (lambda (config)
                                        (eq (map-elt config :identifier) 'codex))
                                      agent-shell-agent-configs)
                            (error "No Codex agent config found"))
                :no-focus t
                :new-session t
                :session-strategy agent-shell-session-strategy))))
    (if-let ((window (get-buffer-window shell-buffer)))
      (if (and (> (count-windows) 1)
            (not (bound-and-true-p transient--prefix)))
        (delete-window window)
        (switch-to-prev-buffer))
      (if agent-shell-prefer-viewport-interaction
        (agent-shell-viewport--show-buffer :shell-buffer shell-buffer)
        (agent-shell--display-buffer shell-buffer)))))

(defun silex/agent-shell-emacs-directory-subdir (subdir)
  (let* ((cwd (string-remove-suffix "/" (agent-shell-cwd)))
          (sanitized (replace-regexp-in-string "/" "-" (string-remove-prefix "/" cwd))))
    (expand-file-name subdir (locate-user-emacs-file (concat "agent-shell/" sanitized)))))

(use-package agent-shell
  :ensure t
  :ensure-system-package
  (codex-acp . "npm install -g @zed-industries/codex-acp")
  :bind
  ("C-c x" . silex/agent-shell-toggle-project)
  :config
  (setopt agent-shell-dot-subdir-function #'silex/agent-shell-emacs-directory-subdir))
