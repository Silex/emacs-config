;; Completion stack (minibuffer + in-buffer)

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

(use-package fuz-bin
  :demand t
  :straight (fuz-bin :repo "jcs-elpa/fuz-bin" :fetcher github :files (:defaults "bin"))
  :config
  (fuz-bin-load-dyn))

(use-package fussy
  :demand t
  :after fuz-bin
  :custom
  (fussy-score-fn 'fussy-fuz-bin-score)
  :config
  (fussy-setup))

(use-package vertico
  :demand t
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy)
  :bind (:map vertico-map
              ("RET" . vertico-directory-enter)
              ("C-j" . vertico-exit-input)
              ("<backspace>" . vertico-directory-delete-char))
  :custom
  (vertico-cycle t)
  (enable-recursive-minibuffers t)
  :config
  (vertico-mode))

(use-package embark
  :demand t
  :bind
  ("C-." . embark-act))

(use-package embark-consult
  :after (embark consult)
  :hook (embark-collect-mode . consult-preview-at-point-mode))

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

(use-package recentf
  :demand t
  :bind ("C-S-t" . undo-kill-buffer)
  :custom
  (recentf-auto-cleanup 'never)
  (recentf-save-file "~/.emacs.d/recentf")
  (recentf-max-menu-items 10000)
  (recentf-max-saved-items nil)
  :config
  (defun undo-kill-buffer (arg)
    "Re-open the last buffer killed.  With ARG, re-open the nth buffer."
    (interactive "p")
    (find-file (nth (1- arg) recentf-list)))
  (recentf-mode t))
