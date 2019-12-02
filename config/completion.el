(use-package flx
  :demand t)

(use-package amx
  :demand t
  :custom
  (amx-history-length 64)
  :config
  (amx-mode))

(use-package ivy
  :demand t
  :bind (("C-b" . ivy-switch-buffer)
         :map ivy-minibuffer-map
              ("C-j" . ivy-immediate-done)
              ("RET" . ivy-alt-done))
  :custom
  (ivy-re-builders-alist '((swiper . ivy--regex-plus)
                           (t . ivy--regex-fuzzy)))
  (ivy-use-virtual-buffers t)
  (ivy-count-format "%d/%d ")
  (ivy-flx-limit 5000)
  (ivy-magic-tilde nil)
  (ivy-magic-slash-non-match-action nil)
  (enable-recursive-minibuffers t)
  :config (ivy-mode))

(use-package counsel
  :demand t
  :bind
  ("C-c k" . counsel-ag)
  ("C-S-r" . counsel-recentf)
  :custom
  (counsel-mode-override-describe-bindings t)
  :config
  (counsel-mode))
