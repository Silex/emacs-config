(use-package magit
  :defer t
  :init
  (setq magit-completing-read-function 'magit-ido-completing-read)
  (setq magit-item-highlight-face 'nil)
  (setq git-commit-mode-hook '(turn-on-auto-fill))
  (setq magit-default-tracking-name-function 'magit-default-tracking-name-branch-only)
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize))
  (setq magit-emacsclient-executable (eval (car (get 'magit-emacsclient-executable 'standard-value)))))

(use-package gitconfig-mode
  :mode (("\\.gitignore\\'" . gitconfig-mode)
         ("\\.gitmodules\\'" . gitconfig-mode)))

(use-package vc-git
  :commands vc-git-grep)

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

;; Close popup when commiting
(defadvice git-commit-commit (after delete-window activate)
  (delete-window))

(defadvice git-commit-abort (after delete-window activate)
  (delete-window))
