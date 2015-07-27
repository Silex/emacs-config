;; recover lost stash: gitk --all $(git fsck --no-reflog | awk '/dangling commit/ {print $3}')

(use-package magit
  :commands magit-status
  :init
  (add-hook 'magit-status-mode-hook 'delete-other-windows)
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

;; Largely stolen from https://github.com/magnars/.emacs.d/blob/master/setup-magit.el

;; Fullscreen vc-annotate
(defadvice vc-annotate (around fullscreen activate)
  (window-configuration-to-register :vc-annotate-fullscreen)
  ad-do-it
  (delete-other-windows))

(defun vc-annotate-quit ()
  "Restores the previous window configuration and kills the vc-annotate buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :vc-annotate-fullscreen))

;; Helpers
(defun delete-trailing-whitespace-and-commit ()
  "Delete trailing whitespace and commit current file"
  (interactive)
  (delete-trailing-whitespace)
  (shell-command (concat "git add " (buffer-file-name)))
  (shell-command "git commit -m'Delete trailing whitespace'"))
