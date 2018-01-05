(use-package smex
  :ensure t
  :defer t
  :custom
  (smex-save-file "~/.emacs.d/smex-items"))

(use-package ivy
  :ensure t
  :bind (("C-b" . ivy-switch-buffer)
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
  ("M-x" . counsel-M-x)
  ("C-x C-f" . counsel-find-file)
  ("<f1> f" . counsel-describe-function)
  ("<f1> v" . counsel-describe-variable)
  ("<f1> l" . counsel-find-library)
  ("<f2> i" . counsel-info-lookup-symbol)
  ("<f2> u" . counsel-unicode-char)
  ("C-c k" . counsel-ag))
