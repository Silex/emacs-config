;; recover lost stash: gitk --all $(git fsck --no-reflog | awk '/dangling commit/ {print $3}')

(use-package gh :ensure t :defer t)
(use-package gist :ensure t :defer t)
(use-package git-messenger :ensure t :defer t)
(use-package git-timemachine :ensure t :defer t)
(use-package github-browse-file :ensure t :defer t)
(use-package github-clone :ensure t :defer t)

(use-package magit
  :ensure t
  :bind ("C-c g" . magit-status)
  :init
  (fullframe magit-status magit-mode-quit-window)
  :custom
  (magit-push-always-verify nil)
  (magit-rebase-arguments '("--autosquash" "--autostash")))

(use-package gitconfig-mode
  :ensure t
  :mode (("\\.gitignore\\'" . gitconfig-mode)
         ("\\.gitmodules\\'" . gitconfig-mode)))

(use-package git-rebase-mode
  :bind (:map git-rebase-mode-map
              ("M-<up>" . git-rebase-move-line-up)
              ("M-<down>" . git-rebase-move-line-down)))

(use-package magithub
  :after magit
  :ensure t
  :defer t)

(use-package fullframe :ensure t :defer t)

(use-package vc-hooks
  :defer t
  :init
  (remove-hook 'find-file-hook 'vc-refresh-state))

(use-package vc-annotate
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
