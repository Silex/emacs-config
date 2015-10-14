;; recover lost stash: gitk --all $(git fsck --no-reflog | awk '/dangling commit/ {print $3}')

(use-package magit
  :commands magit-status
  :init
  (fullframe magit-status magit-mode-quit-window)
  (setq magit-push-always-verify nil)
  (setq magit-completing-read-function 'magit-ido-completing-read))

(use-package gitconfig-mode
  :mode (("\\.gitignore\\'" . gitconfig-mode)
         ("\\.gitmodules\\'" . gitconfig-mode)))

(use-package vc-hooks
  :defer t
  :init
  (remove-hook 'find-file-hook 'vc-find-file-hook)
  (setq vc-handled-backends nil))

(use-package vc-annotate
  :defer t
  :init
  (fullframe vc-annotate kill-this-buffer))

;; Largely stolen from https://github.com/magnars/.emacs.d/blob/master/setup-magit.el

;; Helpers
(defun delete-trailing-whitespace-and-commit ()
  "Delete trailing whitespace and commit current file"
  (interactive)
  (delete-trailing-whitespace)
  (shell-command (concat "git add " (buffer-file-name)))
  (shell-command "git commit -m'Delete trailing whitespace'"))
