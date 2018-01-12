(use-package smex
  :ensure t
  :defer t
  :custom
  (smex-save-file "~/.emacs.d/smex-items"))

(use-package ivy
  :ensure t
  :bind (("C-b" . ivy-switch-buffer)
         ("C-c C-r" . ivy-resume)
         ("C-S-r" . ivy-recentf)
         :map ivy-minibuffer-map
              ("C-j" . ivy-immediate-done)
              ("RET" . ivy-alt-done))
  :custom
  (ivy-re-builders-alist '((t . ivy--regex-fuzzy)))
  (ivy-use-virtual-buffers t)
  (enable-recursive-minibuffers t)
  :config (ivy-mode))

(use-package counsel
  :ensure t
  :bind
  ("C-c k" . counsel-ag)
  :config
  (counsel-mode))
