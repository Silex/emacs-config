;; recover lost stash: gitk --all $(git fsck --no-reflog | awk '/dangling commit/ {print $3}')

(use-package magit
  :commands magit-status
  :init
  (setq magit-completing-read-function 'magit-ido-completing-read))

(use-package gitconfig-mode
  :mode (("\\.gitignore\\'" . gitconfig-mode)
         ("\\.gitmodules\\'" . gitconfig-mode)))

;; Largely stolen from https://github.com/magnars/.emacs.d/blob/master/setup-magit.el

;; Fullscreen magit-status
(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

(defadvice magit-mode-quit-window (after magit-fullscreen activate)
  (jump-to-register :magit-fullscreen))

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

