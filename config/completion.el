(use-package amx
  :demand t
  :custom
  (amx-history-length 64)
  :config
  (amx-mode))

(use-package flx
  :demand t)

(use-package ivy
  :demand t
  :bind (("C-b" . ivy-switch-buffer)
         :map ivy-minibuffer-map
              ("C-j" . ivy-immediate-done)
              ("RET" . ivy-alt-done))
  :custom
  (ivy-use-virtual-buffers t)
  (ivy-count-format "%d/%d ")
  (ivy-magic-tilde nil)
  (ivy-flx-limit 5000)
  (ivy-magic-slash-non-match-action nil)
  (ivy-re-builders-alist '((swiper . ivy--regex-plus)
                           (t . ivy--regex-fuzzy)))
  (enable-recursive-minibuffers t)
  :config (ivy-mode)
  :init
  (setq ivy-re-builders-alist '((swiper . ivy--rege-plus)
                           (t . ivy--regex-fuzzy))))

;; sudo apt install clang
;; (use-package ivy-fuz
;;   :disabled
;;   :demand t
;;   :after ivy
;;   :custom
;;   (ivy-sort-matches-functions-alist '((t . ivy-fuz-sort-fn)))
;;   (ivy-re-builders-alist '((t . ivy-fuz-regex-fuzzy)))
;;   :config
;;   ;;(fuz-build-and-load-dymod)
;;   (require 'ivy-fuz)
;;   (add-to-list 'ivy-highlight-functions-alist '(ivy-fuz-regex-fuzzy . ivy-fuz-highlight-fn)))

(use-package counsel
  :demand t
  :bind
  ("C-c k" . counsel-ag)
  ("C-S-r" . counsel-recentf)
  ("M-x" . amx)
  :custom
  (counsel-mode-override-describe-bindings t)
  :config
  (counsel-mode))

(use-package swiper
  :bind ("C-s" . swiper))

(use-package ivy-hydra)
