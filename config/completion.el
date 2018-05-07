(use-package flx
  :ensure t)

(use-package smex
  :ensure t
  :custom
  (smex-save-file "~/.emacs.d/smex-items"))

(use-package ivy
  :ensure t
  :demand t
  :bind (("C-b" . ivy-switch-buffer)
         ("C-c C-r" . ivy-resume)
         ("C-S-r" . ivy-recentf)
         :map ivy-minibuffer-map
              ("C-j" . ivy-immediate-done)
              ("RET" . ivy-alt-done))
  :custom
  (ivy-re-builders-alist '((swiper . ivy--regex-plus)
                           (t . ivy--regex-fuzzy)))
  (ivy-use-virtual-buffers t)
  (ivy-count-format "%d/%d ")
  (enable-recursive-minibuffers t)
  (ivy-flx-limit 5000)
  :config (ivy-mode))

(use-package counsel
  :ensure t
  :demand t
  :bind
  ("C-c k" . counsel-ag)
  :custom
  (counsel-mode-override-describe-bindings t)
  :config
  (counsel-mode))
