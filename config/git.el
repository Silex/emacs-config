;; recover lost stash: gitk --all $(git fsck --no-reflog | awk '/dangling commit/ {print $3}')

(use-package gh)
(use-package gist)
(use-package git-messenger)
(use-package git-timemachine)
(use-package github-browse-file)
(use-package github-clone)

(use-package magit
  :bind ("C-c g" . magit-status)
  :init
  (fullframe magit-status magit-mode-quit-window)
  :custom
  (magit-push-always-verify nil)
  (magit-rebase-arguments '("--autosquash" "--autostash")))

(use-package gitconfig-mode
  :mode (("\\.gitignore\\'" . gitconfig-mode)
         ("\\.gitmodules\\'" . gitconfig-mode)))

(use-package git-rebase-mode
  :ensure nil
  :bind (:map git-rebase-mode-map
              ("M-<up>" . git-rebase-move-line-up)
              ("M-<down>" . git-rebase-move-line-down)))

(use-package forge
  :demand t
  :after magit)

(use-package fullframe)

(use-package vc-hooks
  :ensure nil
  :init
  (remove-hook 'find-file-hook 'vc-refresh-state))

(use-package vc-annotate
  :ensure nil
  :bind (:map vc-annotate-mode-map ("q" . kill-this-buffer))
  :init
  (fullframe vc-annotate kill-this-buffer))

(defun vc-after-save())

;; Largely stolen from https://github.com/magnars/.emacs.d/blob/master/setup-magit.el

;; Helpers
(defun delete-trailing-whitespace-and-commit ()
  "Delete trailing whitespace and commit current file"
  (interactive)
  (delete-trailing-whitespace)
  (shell-command (concat "git add " (buffer-file-name)))
  (shell-command "git commit -m'Delete trailing whitespace'"))
