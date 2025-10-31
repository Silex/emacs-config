(require 'cl-lib)

(use-package amx
  :demand t
  :custom
  (amx-history-length 64)
  :config
  (amx-mode))

(use-package savehist
  :demand t
  :straight nil
  :custom
  (history-length 200)
  (history-delete-duplicates t)
  :config
  (savehist-mode))

(use-package fuz
  :demand t
  :straight (fuz :type git :host github :repo "rustify-emacs/fuz.el")
  :config
  (unless (require 'fuz-core nil t)
    (fuz-build-and-load-dymod)))

(use-package fussy
  :after fuz
  :demand t
  :custom
  (fussy-score-fn 'fussy-fuz-score)
  :config
  (fussy-setup))

(use-package vertico
  :demand t
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy)
  :bind (:map vertico-map
          ("C-j" . vertico-exit-input)
          ("<backspace>" . vertico-directory-delete-char))
  :custom
  (vertico-cycle t)
  (enable-recursive-minibuffers t)
  :config
  (vertico-mode))

(use-package consult
  :demand t
  :bind
  ("C-S-r" . consult-recent-file)
  :custom
  (consult-project-root-function #'projectile-project-root)
  :config
  (consult-customize consult-recent-file :preview-key nil))

(use-package consult-dir
  :after consult)

(use-package marginalia
  :demand t
  :custom
  (marginalia-max-relative-age 0)
  :config
  (setf (alist-get 'file marginalia-annotators) '(none))
  (setf (alist-get 'project-file marginalia-annotators) '(none))
  (marginalia-mode))

(use-package embark
  :demand t
  :bind
  ("C-." . embark-act))

(use-package embark-consult
  :after (embark consult)
  :hook (embark-collect-mode . consult-preview-at-point-mode))

(use-package corfu
  :demand t
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  (corfu-quit-at-boundary t)
  (corfu-quit-no-match 'separator)
  (corfu-preselect-first nil)
  (corfu-preview-current nil)
  :config
  (global-corfu-mode))

(use-package cape
  :demand t
  :bind ("C-c ." . cape-prefix-map)
  :custom
  (tab-always-indent 'complete)
  (completion-cycle-threshold 1)
  (completion-ignore-case t)
  (read-buffer-completion-ignore-case t)
  (read-file-name-completion-ignore-case t)
  :init
  (add-hook 'completion-at-point-functions #'cape-keyword)
  (add-hook 'completion-at-point-functions #'cape-dabbrev)
  (add-hook 'completion-at-point-functions #'cape-file))
