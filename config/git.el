(use-package magit
  :commands magit-status)

(use-package gitconfig-mode
  :mode ("\\.gitignore\\'" . gitconfig-mode))

(use-package git-messenger
  :commands git-messenger:popup-message)

(use-package gist
  :commands (gist-buffer
             gist-region
             gist-list))

;; Largely stolen from https://github.com/magnars/.emacs.d/blob/master/setup-magit.el

;; Fullscreen magit-status
(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

(defun magit-status-quit ()
  "Restores the previous window configuration and kills the magit buffer"
  (interactive)
  (kill-buffer)
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

;; Open a new line on a new commit (looks prettier)
(defun magit-commit-mode-init ()
  (when (looking-at "\n")
    (open-line 1)))

(add-hook 'git-commit-mode-hook 'magit-commit-mode-init)

;; Close popup when commiting
(defadvice git-commit-commit (after delete-window activate)
  (delete-window))

(defadvice git-commit-abort (after delete-window activate)
  (delete-window))
